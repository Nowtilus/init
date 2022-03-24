#!/bin/sh
for i in $( seq 0 15 ); do sudo find /mnt/ramdisk/das-2-ssai/$(printf "%1x" $i)  -type f -mmin +60 -delete; done