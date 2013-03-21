TARGETS = mountkernfs.sh hostname.sh fake-hwclock udev keyboard-setup console-setup networking mountall.sh mountall-bootclean.sh urandom mountnfs.sh mountnfs-bootclean.sh hwclock.sh alsa-utils mountdevsubfs.sh checkroot.sh mtab.sh kmod checkroot-bootclean.sh bootmisc.sh udev-mtab procps checkfs.sh x11-common
INTERACTIVE = udev keyboard-setup console-setup checkroot.sh checkfs.sh
udev: mountkernfs.sh
keyboard-setup: mountkernfs.sh udev
console-setup: mountall.sh mountall-bootclean.sh mountnfs.sh mountnfs-bootclean.sh
networking: mountkernfs.sh mountall.sh mountall-bootclean.sh urandom
mountall.sh: checkfs.sh checkroot-bootclean.sh
mountall-bootclean.sh: mountall.sh
urandom: mountall.sh mountall-bootclean.sh hwclock.sh
mountnfs.sh: mountall.sh mountall-bootclean.sh networking
mountnfs-bootclean.sh: mountall.sh mountall-bootclean.sh mountnfs.sh
hwclock.sh: mountdevsubfs.sh
alsa-utils: mountall.sh mountall-bootclean.sh mountnfs.sh mountnfs-bootclean.sh
mountdevsubfs.sh: mountkernfs.sh udev
checkroot.sh: hwclock.sh keyboard-setup mountdevsubfs.sh hostname.sh fake-hwclock
mtab.sh: checkroot.sh
kmod: checkroot.sh
checkroot-bootclean.sh: checkroot.sh
bootmisc.sh: checkroot-bootclean.sh mountnfs-bootclean.sh mountall.sh mountall-bootclean.sh mountnfs.sh udev
udev-mtab: udev mountall.sh mountall-bootclean.sh
procps: mountkernfs.sh mountall.sh mountall-bootclean.sh udev
checkfs.sh: checkroot.sh mtab.sh
x11-common: mountall.sh mountall-bootclean.sh mountnfs.sh mountnfs-bootclean.sh
