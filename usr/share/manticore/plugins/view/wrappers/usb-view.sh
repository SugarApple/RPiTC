#!/bin/bash

PROTO_KEY="$1"
KEY=$(mclient --quiet get $1)
LNK=/etc/vmware/usb.link
USBR=/usr/lib/vmware/vmware-view-usb

if [ "$KEY" = "view" ]; then
	ln -s $USBR $LNK
else
	rm $LNK
fi

return 0
