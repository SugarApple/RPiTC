TARGETS = mountkernfs.sh fake-hwclock hostname.sh udev mountdevsubfs.sh keymap.sh keyboard-setup console-setup networking mountall.sh mountoverflowtmp urandom mountnfs.sh mountnfs-bootclean.sh checkroot.sh mountall-bootclean.sh procps udev-mtab mtab.sh checkfs.sh bootmisc.sh x11-common kbd kmod
INTERACTIVE = udev keymap.sh keyboard-setup console-setup checkroot.sh checkfs.sh kbd
udev: mountkernfs.sh
mountdevsubfs.sh: mountkernfs.sh udev
keymap.sh: mountdevsubfs.sh
keyboard-setup: mountkernfs.sh keymap.sh udev
console-setup: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh kbd
networking: mountkernfs.sh mountall.sh mountoverflowtmp
mountall.sh: checkfs.sh
mountoverflowtmp: mountall-bootclean.sh
urandom: mountall.sh mountoverflowtmp
mountnfs.sh: mountall.sh mountoverflowtmp networking
mountnfs-bootclean.sh: mountall.sh mountoverflowtmp mountnfs.sh
checkroot.sh: fake-hwclock mountdevsubfs.sh hostname.sh keymap.sh keyboard-setup
mountall-bootclean.sh: mountall.sh
procps: mountkernfs.sh mountall.sh mountoverflowtmp udev
udev-mtab: udev mountall.sh mountoverflowtmp
mtab.sh: checkroot.sh
checkfs.sh: checkroot.sh mtab.sh
bootmisc.sh: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh udev
x11-common: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh
kbd: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh
kmod: checkroot.sh
