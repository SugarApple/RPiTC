TARGETS = fake-hwclock hostname.sh mountkernfs.sh udev mountdevsubfs.sh keymap.sh keyboard-setup console-setup hwclock.sh checkroot.sh mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh urandom mountall-bootclean.sh kbd kmod mtab.sh checkfs.sh procps udev-mtab x11-common bootmisc.sh
INTERACTIVE = udev keymap.sh keyboard-setup console-setup checkroot.sh kbd checkfs.sh
udev: mountkernfs.sh
mountdevsubfs.sh: mountkernfs.sh udev
keymap.sh: mountdevsubfs.sh
keyboard-setup: mountkernfs.sh keymap.sh udev
console-setup: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh kbd
hwclock.sh: mountdevsubfs.sh
checkroot.sh: hwclock.sh fake-hwclock keyboard-setup mountdevsubfs.sh hostname.sh keymap.sh
mountall.sh: checkfs.sh
mountoverflowtmp: mountall-bootclean.sh
mountnfs.sh: mountall.sh mountoverflowtmp
mountnfs-bootclean.sh: mountall.sh mountoverflowtmp mountnfs.sh
urandom: mountall.sh mountoverflowtmp
mountall-bootclean.sh: mountall.sh
kbd: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh
kmod: checkroot.sh
mtab.sh: checkroot.sh
checkfs.sh: checkroot.sh mtab.sh
procps: mountkernfs.sh mountall.sh mountoverflowtmp udev
udev-mtab: udev mountall.sh mountoverflowtmp
x11-common: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh
bootmisc.sh: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh udev
