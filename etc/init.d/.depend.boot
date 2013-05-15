TARGETS = mountall.sh fake-hwclock mountkernfs.sh hostname.sh kmod udev keyboard-setup console-setup alsa-utils mountall-bootclean.sh mountnfs-bootclean.sh hwclock.sh mountdevsubfs.sh urandom networking procps x11-common udev-mtab
INTERACTIVE = udev keyboard-setup console-setup
udev: mountkernfs.sh
keyboard-setup: mountkernfs.sh udev
console-setup: mountall.sh mountall-bootclean.sh mountnfs-bootclean.sh
alsa-utils: mountall.sh mountall-bootclean.sh mountnfs-bootclean.sh
mountall-bootclean.sh: mountall.sh
mountnfs-bootclean.sh: mountall.sh mountall-bootclean.sh
hwclock.sh: mountdevsubfs.sh
mountdevsubfs.sh: mountkernfs.sh udev
urandom: mountall.sh mountall-bootclean.sh hwclock.sh
networking: mountkernfs.sh mountall.sh mountall-bootclean.sh urandom procps
procps: mountkernfs.sh mountall.sh mountall-bootclean.sh udev
x11-common: mountall.sh mountall-bootclean.sh mountnfs-bootclean.sh
udev-mtab: udev mountall.sh mountall-bootclean.sh
