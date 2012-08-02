TARGETS = mountkernfs.sh fake-hwclock hostname.sh udev mountdevsubfs.sh keymap.sh keyboard-setup console-setup mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh hwclock.sh urandom networking checkroot.sh kbd udev-mtab bootmisc.sh kmod x11-common procps mountall-bootclean.sh checkfs.sh mtab.sh
INTERACTIVE = udev keymap.sh keyboard-setup console-setup checkroot.sh kbd checkfs.sh
udev: mountkernfs.sh
mountdevsubfs.sh: mountkernfs.sh udev
keymap.sh: mountdevsubfs.sh
keyboard-setup: mountkernfs.sh keymap.sh udev
console-setup: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh kbd
mountall.sh: checkfs.sh
mountoverflowtmp: mountall-bootclean.sh
mountnfs.sh: mountall.sh mountoverflowtmp networking
mountnfs-bootclean.sh: mountall.sh mountoverflowtmp mountnfs.sh
hwclock.sh: mountdevsubfs.sh
urandom: mountall.sh mountoverflowtmp
networking: mountkernfs.sh mountall.sh mountoverflowtmp
checkroot.sh: hwclock.sh fake-hwclock keyboard-setup mountdevsubfs.sh hostname.sh keymap.sh
kbd: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh
udev-mtab: udev mountall.sh mountoverflowtmp
bootmisc.sh: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh udev
kmod: checkroot.sh
x11-common: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh
procps: mountkernfs.sh mountall.sh mountoverflowtmp udev
mountall-bootclean.sh: mountall.sh
checkfs.sh: checkroot.sh mtab.sh
mtab.sh: checkroot.sh
