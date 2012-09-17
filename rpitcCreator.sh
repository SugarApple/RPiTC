#!/bin/bash
#FAT16 lba boot partition with kernel.img .elf and .bin
bootsize="64M"
#EXT4 root file system
rootsize="3000M"
#size of your sdcard erase block size, needed to correctly align partitions
delblocksize="128"
device=$1

if [ $EUID -ne 0 ]; then
  echo "you must be root"
  exit 1
fi

if [ "$device" == "" ]; then
  echo "no device specified! Usage: ./rpitcCreator.sh /dev/mmcblk0 (or your destination device)"
  exit 1
fi

if ! [ -b $device ]; then
  echo "$device is not a block device"
  exit 1
fi

#delete partition table
dd if=/dev/zero of=$device bs=512 count=1

#creating partition table
fdisk -H224 -S32 $device << EOF
n
p
1

+$bootsize
x
b
1
$delblocksize
r
t
c
n
p
2

+$rootsize
w
EOF

#creating FS
bootp=${device}1
rootp=${device}2
umount $bootp
umount $rootp

mkfs.vfat -n BOOT $bootp
mkfs.ext4 -E stripe-width=32 -m 0 -L rpitc $rootp

mkdir -p /media/BOOT
mkdir -p /media/rpitc

mount $bootp /media/BOOT
mount $rootp /media/rpitc

#removing lost+found folder if exist on desination
rm -fr /media/BOOT/lost+found/
rm -fr /media/rpitc/lost+found/

#cloning boot and system
git clone https://github.com/Gibbio/RPiTC-Kernel.git /media/BOOT/
git clone https://github.com/Gibbio/RPiTC.git /media/rpitc/

#creating needed (and missing) directory: boot dev lost+found media mnt proc run selinux svr sys tmp
mkdir /media/rpitc/boot/ /media/rpitc/dev/ /media/rpitc/lost+found/ /media/rpitc/media/ /media/rpitc/mnt/ /media/rpitc/proc/ /media/rpitc/run/ /media/rpitc/selinux/ /media/rpitc/svr/ /media/rpitc/sys/ /media/rpitc/tmp/


