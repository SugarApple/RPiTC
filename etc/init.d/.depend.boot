TARGETS = mountkernfs.sh fake-hwclock hostname.sh udev mountdevsubfs.sh keymap.sh keyboard-setup console-setup networking mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh alsa-utils urandom checkroot.sh kbd bootmisc.sh checkfs.sh mtab.sh kmod mountall-bootclean.sh x11-common procps udev-mtab
INTERACTIVE = udev keymap.sh keyboard-setup console-setup checkroot.sh kbd checkfs.sh
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
alsa-utils: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh
urandom: mountall.sh mountoverflowtmp
checkroot.sh: fake-hwclock mountdevsubfs.sh hostname.sh keymap.sh keyboard-setup
kbd: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh
bootmisc.sh: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh udev
checkfs.sh: checkroot.sh mtab.sh
mtab.sh: checkroot.sh
kmod: checkroot.sh
mountall-bootclean.sh: mountall.sh
x11-common: mountall.sh mountoverflowtmp mountnfs.sh mountnfs-bootclean.sh
procps: mountkernfs.sh mountall.sh mountoverflowtmp udev
udev-mtab: udev mountall.sh mountoverflowtmp
