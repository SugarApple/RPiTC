TARGETS = mountkernfs.sh fake-hwclock hostname.sh udev mountdevsubfs.sh keymap.sh keyboard-setup console-setup networking mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh checkroot.sh urandom mtab.sh checkfs.sh procps bootmisc.sh mountall-bootclean.sh udev-mtab kbd kmod x11-common
INTERACTIVE = udev keymap.sh keyboard-setup console-setup checkroot.sh checkfs.sh kbd
udev: mountkernfs.sh
mountdevsubfs.sh: mountkernfs.sh udev
keymap.sh: mountdevsubfs.sh
keyboard-setup: mountkernfs.sh keymap.sh udev
console-setup: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh kbd
networking: mountkernfs.sh mountall.sh mountoverflowtmp
mountall.sh: checkfs.sh
mountoverflowtmp: mountall-bootclean.sh
mountnfs.sh: mountall.sh mountoverflowtmp networking
mountnfs-bootclean.sh: mountall.sh mountoverflowtmp mountnfs.sh
checkroot.sh: fake-hwclock keyboard-setup mountdevsubfs.sh hostname.sh keymap.sh
urandom: mountall.sh mountoverflowtmp
mtab.sh: checkroot.sh
checkfs.sh: checkroot.sh mtab.sh
procps: mountkernfs.sh mountall.sh mountoverflowtmp udev
bootmisc.sh: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh udev
mountall-bootclean.sh: mountall.sh
udev-mtab: udev mountall.sh mountoverflowtmp
kbd: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh
kmod: checkroot.sh
x11-common: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh
