#!/bin/sh
mkdir /mnt/ramdisk
mount -t tmpfs -o size=25G ramdisk /mnt/ramdisk
apt-get update
apt-get -y install nfs-kernel-server
echo "/mnt/ramdisk/ 10.0.0.0/8(rw,async,no_subtree_check,anonuid=33,anongid=33,fsid=42)" >> /etc/exports
systemctl restart nfs-kernel-server
#* * * * * sudo find /mnt/ramdisk/das-2-ssai/media -type f -mmin +120 -delete
#* * * * * sudo find /mnt/ramdisk/das-2-ssai/vast -type f -mmin +120 -delete