TARGETS = fake-hwclock mountkernfs.sh hostname.sh udev mountdevsubfs.sh keymap.sh keyboard-setup console-setup alsa-utils mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh networking checkroot.sh urandom x11-common mountall-bootclean.sh procps kmod checkfs.sh udev-mtab mtab.sh bootmisc.sh kbd
INTERACTIVE = udev keymap.sh keyboard-setup console-setup checkroot.sh checkfs.sh kbd
udev: mountkernfs.sh
mountdevsubfs.sh: mountkernfs.sh udev
keymap.sh: mountdevsubfs.sh
keyboard-setup: mountkernfs.sh keymap.sh udev
console-setup: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh kbd
alsa-utils: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh
mountall.sh: checkfs.sh
mountoverflowtmp: mountall-bootclean.sh
mountnfs.sh: mountall.sh mountoverflowtmp networking
mountnfs-bootclean.sh: mountall.sh mountoverflowtmp mountnfs.sh
networking: mountkernfs.sh mountall.sh mountoverflowtmp
checkroot.sh: fake-hwclock mountdevsubfs.sh hostname.sh keymap.sh keyboard-setup
urandom: mountall.sh mountoverflowtmp
x11-common: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh
mountall-bootclean.sh: mountall.sh
procps: mountkernfs.sh mountall.sh mountoverflowtmp udev
kmod: checkroot.sh
checkfs.sh: checkroot.sh mtab.sh
udev-mtab: udev mountall.sh mountoverflowtmp
mtab.sh: checkroot.sh
bootmisc.sh: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh udev
kbd: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh
