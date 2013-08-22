TARGETS = mountall.sh fake-hwclock mountkernfs.sh hostname.sh udev keyboard-setup console-setup urandom mountall-bootclean.sh hwclock.sh mountnfs-bootclean.sh networking alsa-utils mountdevsubfs.sh x11-common kmod udev-mtab procps
INTERACTIVE = udev keyboard-setup console-setup
udev: mountkernfs.sh
keyboard-setup: mountkernfs.sh udev
console-setup: mountall.sh mountall-bootclean.sh mountnfs-bootclean.sh
urandom: mountall.sh mountall-bootclean.sh hwclock.sh
mountall-bootclean.sh: mountall.sh
hwclock.sh: mountdevsubfs.sh
mountnfs-bootclean.sh: mountall.sh mountall-bootclean.sh
networking: mountkernfs.sh mountall.sh mountall-bootclean.sh urandom procps
alsa-utils: mountall.sh mountall-bootclean.sh mountnfs-bootclean.sh
mountdevsubfs.sh: mountkernfs.sh udev
x11-common: mountall.sh mountall-bootclean.sh mountnfs-bootclean.sh
udev-mtab: udev mountall.sh mountall-bootclean.sh
procps: mountkernfs.sh mountall.sh mountall-bootclean.sh udev
