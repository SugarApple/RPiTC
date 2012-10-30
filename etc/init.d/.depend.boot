TARGETS = mountkernfs.sh fake-hwclock hostname.sh udev mountdevsubfs.sh keymap.sh keyboard-setup console-setup urandom mountall.sh hwclock.sh mountnfs.sh mountnfs-bootclean.sh networking alsa-utils checkroot.sh mountall-bootclean.sh udev-mtab kbd bootmisc.sh checkroot-bootclean.sh kmod procps mtab.sh checkfs.sh x11-common
INTERACTIVE = udev keymap.sh keyboard-setup console-setup checkroot.sh kbd checkfs.sh
udev: mountkernfs.sh
mountdevsubfs.sh: mountkernfs.sh udev
keymap.sh: mountdevsubfs.sh
keyboard-setup: mountkernfs.sh keymap.sh udev
console-setup: mountall.sh mountnfs.sh mountnfs-bootclean.sh kbd
urandom: mountall.sh hwclock.sh
mountall.sh: checkfs.sh
hwclock.sh: mountdevsubfs.sh
mountnfs.sh: mountall.sh networking
mountnfs-bootclean.sh: mountall.sh mountnfs.sh
networking: mountkernfs.sh mountall.sh urandom
alsa-utils: mountall.sh mountnfs.sh mountnfs-bootclean.sh
checkroot.sh: hwclock.sh fake-hwclock keyboard-setup mountdevsubfs.sh hostname.sh keymap.sh
mountall-bootclean.sh: mountall.sh
udev-mtab: udev mountall.sh
kbd: mountall.sh mountnfs.sh mountnfs-bootclean.sh
bootmisc.sh: mountall.sh mountnfs.sh mountnfs-bootclean.sh udev
checkroot-bootclean.sh: checkroot.sh
kmod: checkroot.sh
procps: mountkernfs.sh mountall.sh udev
mtab.sh: checkroot.sh
checkfs.sh: checkroot.sh mtab.sh
x11-common: mountall.sh mountnfs.sh mountnfs-bootclean.sh
