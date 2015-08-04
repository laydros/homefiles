#!/bin/bash

mkdir /mnt/download
mkdir /mnt/multimedia
mkdir /home/m3db

apt-get update
apt-get install cifs-utils

echo '//10.1.0.242/m3db   /home/m3db  cifs    credentials=/home/laydros/.smbpass,rw,gid=laydros,uid=laydros,noauto  0   0' >> /etc/fstab
echo '//192.168.1.150/download     /mnt/download   cifs       credentials=/home/laydros/.naspass,rw,gid=laydros,uid=laydros,noauto      0       0' >> /etc/fstab
echo '//192.168.1.150/multimedia   /mnt/multimedia cifs       credentials=/home/laydros/.naspass,rw,gid=laydros,uid=laydros,noauto      0       0' >> /etc/fstab

echo 'You need to copy the .naspass and .smbpass files to your home dir'
