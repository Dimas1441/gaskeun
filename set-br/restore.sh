#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
echo "Fitur Ini Hanya Dapat Digunakan Menurut Data Vps Dengan Autoscript Ini"
echo "Silakan Masukkan Tautan Ke File Cadangan Data Vps Anda."
echo "Anda Dapat Memeriksanya Di Email Anda Jika Anda Menjalankan Vps Data Cadangan Sebelumnya."
read -rp "Link File: " -e url
wget -O backup.zip "$url"
unzip backup.zip
rm -f backup.zip
sleep 1
echo Start Restore
cd /root/backup
cp passwd /etc/
cp group /etc/
cp shadow /etc/
cp gshadow /etc/
cp -r wireguard /etc/
cp chap-secrets /etc/ppp/
cp passwd1 /etc/ipsec.d/passwd
cp ss.conf /etc/shadowsocks-libev/ss.conf
cp -r premium-script /var/lib/
cp -r sstp /home/
cp -r trojan /etc/
cp -r v2ray /etc/
cp -r shadowsocksr /usr/local/
cp -r public_html /home/vps/
cp crontab /etc/
strt
rm -rf /root/backup
rm -f backup.zip
echo Done
