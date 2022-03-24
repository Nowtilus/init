#!/bin/sh
mkdir /mnt/ramdisk
mount -t tmpfs -o size=25G ramdisk /mnt/ramdisk
apt-get update
apt-get -y install nfs-kernel-server wget nginx
apt-get -y install build-essential libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev libgd-dev libxml2 libxml2-dev uuid-dev

echo "/mnt/ramdisk/ 10.0.0.0/8(rw,async,no_subtree_check,anonuid=33,anongid=33,fsid=42)" >> /etc/exports
systemctl restart nfs-kernel-server
wget https://github.com/Nowtilus/init/raw/master/clean.sh -O /usr/bin/clean.sh
wget https://github.com/Nowtilus/init/raw/master/nginx/default -O /etc/nginx/sites-enabled
wget https://github.com/Nowtilus/init/raw/master/bin/nginx -O /usr/sbin/nginx
chmod +x /usr/sbin/nginx

service nginx restart
echo "* * * * * sh /urs/bin/clean.sh > /etc/crontab/cleanramdisk"


#* * * * * sudo find /mnt/ramdisk/das-2-ssai/media -type f -mmin +120 -delete
#* * * * * sudo find /mnt/ramdisk/das-2-ssai/vast -type f -mmin +120 -delete