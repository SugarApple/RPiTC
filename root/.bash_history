#second stage debootstrap
/debootstrap/debootstrap --second-stage
ls
cd /root
cat <<END > /etc/apt/sources.list
deb http://ftp.de.debian.org/debian wheezy main contrib non-free
deb http://ftp.debian.org/debian/ wheezy-updates main contrib non-free
deb http://security.debian.org/ wheezy/updates main contrib non-free
END

apt-get update
exit
export LANG=C
cat <<END > /etc/apt/apt.conf
APT::Install-Recommends "0";
APT::Install-Suggests "0";
Acquire::PDiffs "false";
END

apt-get update
apt-get install --no-install-recommends apt-utils dialog locales localepurge deborphan
apt-get install --no-install-recommends module-init-tools network-manager udev netbase ifupdown iproute openssh-server iputils-ping wget net-tools ntpdate nano
ls
#configure networking, hostname, fstab, sysctl ecceccecc:
cat <<END > /etc/network/interfaces
auto lo
iface lo inet loopback
END

echo rpitc > /etc/hostname
cat <<END > /etc/fstabproc /proc proc nodev,noexec,nosuid 0 0
tmpfs /tmp tmpfs nodev,nosuid 0 0
tmpfs /var/log tmpfs nodev,nosuid 0 0
/dev/mmcblk0p1 /boot vfat defaults 1 2
/dev/mmcblk0p2 / ext4 defaults,noatime,nodiratime 0 1
END

cat <<END > /root/.bash_profile
export LD_LIBRARY_PATH="/usr/local/lib/;/usr/local/lib/arm-linux-gnueabi/"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx >/dev/null 2>&1
fi

END

#don't switch off monitor
echo 'xset s off' >> /root/.xsessionrc
echo 'xset -dpms' >> /root/.xsessionrc
sed -i 's/^\([1-6]:.* tty[1-6]\)/#\1/' /etc/inittab
echo '1:2345:respawn:/bin/login -f root tty1 </dev/tty1 >/dev/tty1 2>&1' >> /etc/inittab
echo '#Spawn a getty on Raspberry Pi serial line' >> /etc/inittab
echo 'T0:23:respawn:/sbin/getty -L ttyAMA0 115200 vt100' >> /etc/inittab
echo CONCURRENCY=shell >> /etc/default/rcS
rm -f /etc/blkid.tab
ln -s /dev/null /etc/blkid.tab
rm -f /etc/mtab
ln -s /proc/mounts /etc/mtab
echo 'kernel.sem = 250 32000 100 128' >> /etc/sysctl.conf
echo 'kernel.shmall = 2097152' >> /etc/sysctl.conf
echo 'kernel.shmmax = 2147483648' >> /etc/sysctl.conf
echo 'kernel.shmmni = 4096' >> /etc/sysctl.conf
echo 'fs.file-max = 65535' >> /etc/sysctl.conf
echo 'vm.swappiness = 1' >> /etc/sysctl.conf
echo 'vm.vfs_cache_pressure = 50' >> /etc/sysctl.conf
echo 'vm.dirty_background_ratio = 20' >> /etc/sysctl.conf
echo 'vm.dirty_expire_centisecs = 0' >> /etc/sysctl.conf
echo 'vm.dirty_ratio = 80' >> /etc/sysctl.conf
echo 'vm.dirty_writeback_centisecs = 1500' >> /etc/sysctl.conf
echo 'vm.laptop_mode = 5' >> /etc/sysctl.conf
echo 'vm.min_free_kbytes = 8192' >> /etc/sysctl.conf
echo 'snd_bcm2835' >> /etc/modules
touch /root/.hushlogin
rm -f /etc/issue
rm -f /etc/motd
rm -f /etc/motd.tail
apt-get install --no-install-recommends lxde xserver-xorg xserver-xorg-core xserver-xorg-input-all xserver-xorg-input-evdev xserver-xorg-input-synaptics xserver-xorg-video-fbdev xserver-xorg-video-vesa hicolor-icon-theme alsa-utils usbutils wireless-tools wpagui wpasupplicant alsa-base ntp ssh fake-hwclock ca-certificates xorg iceweasel
ls
ls
ls
du -sh *
cd tmp/
ls
rm -fr *
ls
cd ..
ls
startx
hostname rpitc
nano /etc/hosts
reboot 
more .bash_profile 
ifconfig 
passwd root
cat <<END > /root/.bash_profile
export LD_LIBRARY_PATH="/usr/local/lib/;/usr/local/lib/arm-linux-gnueabi/"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx >/dev/null 2>&1
fi




END

cat <<END > /root/.bash_profile
export LD_LIBRARY_PATH="/usr/local/lib/;/usr/local/lib/arm-linux-gnueabi/"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx >/dev/null 2>&1
fi

END

reboot 
nano .bash_
nano .bash_profile 
reboot 
halt
