/***************************************************************************
 *
 *   jpeg_decode.h
 *
 *   Citrix Receiver interface to JPEG decoders.
 *
 *   $Id: //icaclient/unix/soc/release/client/unix/inc/jpeg_decode.h#4 $
 *
 *   Copyright 2011-2012 Citrix Systems, Inc.  All Rights Reserved.
 *
 ***************************************************************************/

#ifndef _JPEG_DECODE_H_
#define _JPEG_DECODE_H_

/* This header defines the interface between the Citrix Receiver and
 * JPEG decoding libraries, particularly hardware-accelerated decoders.
 * A library implementing this interface will be dynamically loaded by
 * Receiver and is expected to have a single exported symbol, identifying a
 * structure which describes its capabilities and entry points.
 *
 * There are three entry points: start_decode() to pass a decoding request,
 * finish_decode() to wait for a request to complete and complete_request()
 * to determine which asynchronous, possibly parallel, request has completed.
 * There is also an option to use a callback function instead of calling
 * complete_request().
 *
 * All requests must be handled independently, with any clean-up following
 * failure performed before a request is considered complete.
 */

/* This structure describes a request to decode a compressed image.
 * When decoding is completed asynchronously, a structure pointer
 * is used as a handle to retrieve the completion status.
 *
 * Members are marked with I, O, B, N to indicate the direction of data
 * transfer: Input (to library), Output, Both, Neither.
 * Note that the caller of start_decode() allocates the output buffer.
 *
 * There are four methods that may be used by the library to indicate that
 * an asynchronous decoding request is complete.
 *   Polling: the library sets the "status" member in the request structure
 *     and the caller polls its outstanding requests between other tasks.
 *     This must always be supported.
 *   Callback: libraries that create a thread for their own use can call
 *     a function provided with the request to indicate completion.
 *     Creation of such a thread just for completion reporting is discouraged.
 *   Signal: the library (or kernel drivers) may deliver a signal, to the
 *     original calling thread (pthread_signal()).
 *   I/O completion: If there is an open descriptor for an I/O device that
 *     provides data when a request is complete, the library may return
 *     the file descriptor.  The caller may use it only to determine
 *     when data is ready to read (select(), poll(), epoll()) and will
 *     not perform any other operations on the descriptor.
 *
 * The caller may set callback to NULL, completion_sig to -1,
 * and completion_fd to -1 to indicate that those completion notification
 * methods will not be used.
 *
 * When either signal or file descriptor is used for completion
 * notification, a call to complete_request() will be made when the
 * notification is processed, to give control to the library so that
 * it has the opportunity to update the status and indicate which
 * request has completed.  Otherwise complete_request() must not be called.
 * The finish_request() function must only be called when none of the
 * asynchronous notification methods are in use for the request.
 */

struct JPEG_request {
    void               *image;          /* I: pointer to input. */
    unsigned int        size;           /* I: size of image (bytes). */
    void               *buffer;         /* I: output location. */
    unsigned int        width, height;  /* B: image size (pixels). */
    unsigned int        stride;         /* I: output row separation (bytes). */
    unsigned int        format;         /* I: output pixel format. */
    void               *private;        /* N: Decoder's own use. */
    volatile int        status;         /* O: status of request. */
                                        /* I: only if COMPLETION_CB set. */
    void              (*callback)(struct JPEG_request *);
    int                 completion_sig; /* I: only if COMPLETION_SIG is set. */
    int                 completion_fd;  /* B: only if COMPLETION_FD set. */
};

/* Request status values. */

#define JPEG_SUCCESS    0               /* Request completed. */
#define JPEG_BUSY       1               /* Request in progress. */
#define JPEG_BAD_FIT    2               /* Actual size differs from request. */
#define JPEG_SHORT      3               /* Incomplete image. */
#define JPEG_BAD_DATA   4               /* Invalid input. */
#define JPEG_BAD_PARAM  5               /* Invalid argument. */
#define JPEG_INTERNAL   6               /* Internal decoder problem. */

#define JPEG_LAST_RV    6

/* Decoders are loaded as a shared library containing an exported symbol,
 * JPEG_decoder, pointing to an instance of this structure.
 */

struct JPEG_decoder {
    /* Capabilities - indicating what this decoder can do. */

    unsigned int input_formats;

#define TRADITIONAL_JPEG        1       /* Compatible with libjpeg.so.62 */
#define ARITMETIC_ENCODING      2       /* JPEGs with arithmetic encoding. */
#define JPEG_XR                 4       /* ISO/IEC 29199-2 (2009) or HD_PHOTO */

    unsigned int output_formats;

#define PIXEL_XRGB              1       /* 32-bit, red (0xff0000),
                                         * green (0xff00), blue (0xff).
                                         */
#define PIXEL_XBGR              2       /* 32-bit, red (0xff), etc. */

   /* Does the decode function block, or does it return while decoding
    * continues concurrently.  If so, how is completion reported?
    * The supported methods are: the caller polls each request struct and
    * those whose status is not JPEG_BUSY have completed;
    * a callback is made by another thread;
    * a signal is directed to the calling thread;
    * or an open file descriptor becomes ready for reading (but the caller
    * will not read it directly).
    *
    * Implementations should not do anything unusual
    * (such as creating a thread) to support asynchronous processing.
    * It is perfectly acceptable to support only synchronous completion.
    */

    unsigned int completion_handling;

#define BACKGROUND_DECODING     1       /* Caller continues during decoding. */
#define COMPLETION_CALLBACK     2       /* Callback in library's own thread. */
#define COMPLETION_SIGNAL       4       /* Signal sent on completion. */
#define COMPLETION_FD           8       /* Completion via select()/poll(). */

    /* Can the library decode more than one JPEG concurrently? */

    unsigned int concurrency;           /* Must be >= 1. */

    /* Can the library accept queued requests? */

    unsigned int queue_limit;           /* May be zero. */

    /* If the decoder is more efficient when the output buffer has specific
     * alignment in memory, the preferred alignment is set here.
     * A buffer address is preferred when there is no remainder on division
     * by the alignment value.
     * The library must return the data as requested in all cases, but the
     * caller may use this value to optimise buffer allocation.
     */

    unsigned int preferred_alignment;

    /* Entry points: request a decoding.
     * If the request is not complete when the function returns
     * (asynchronous operation) the "status" member must be set to JPEG_BUSY.
     * If JPEG_BAD_FIT is returned, request->width and request->height
     * should contain the correct values on return.
     */

    void (*start_decode)(struct JPEG_request *request);

    /* Request the result of a previous request, blocking if necessary.
     * It is not needed if start_decode() is synchronous, but may be called,
     * so the function should simply return immediately if the request
     * is already marked as complete (status not JPEG_BUSY).
     * If JPEG_BAD_FIT is returned, request->width and request->height
     * should contain the correct values on return.
     * Not to be called when any form of asynchronous completion notification
     * was requested.
     */

    void (*finish_decode)(struct JPEG_request *request);

    /* If either of the signal or I/O readiness completion reporting
     * methods are in use, this function must be called to determine
     * which request has completed.  The return value is a pointer to
     * a freshly-completed request block, or NULL if no request has
     * completed since the last call.
     */

    struct JPEG_request *(*complete_request)(void);
};

#endif /* _JPEG_DECODE_H_ */
