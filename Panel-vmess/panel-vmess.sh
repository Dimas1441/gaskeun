#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
echo -e ""
echo -e "${red}======================================${off}"
echo -e "          ${green}PANEL V2RAY VMESS${off}"
echo -e "${red}======================================${off}"
echo -e "${white}"
echo -e "     1 =>  Buat Akun Vmess Websocket"
echo -e "     2 =>  Buat Trial Vmess Websocket"
echo -e "     3 =>  Hapus Akun Vmess Websocket"
echo -e "     4 =>  Perbarui Akun Vmess"
echo -e "     5 =>  Cek Login Vmess"
echo -e "     x =>  Keluar"
echo -e "${off}"
echo -e "${red}======================================${off}"
echo -e "${white}"
read -p "     Pilih Nomor [1-5 / x] :  " port
echo -e "${off}"

case $port in
1)
add-ws
;;
2)
trialws
;;
3)
del-ws
;;
4)
renew-ws
;;
5)
cek-ws
;;
x)
clear
menu
;;
*)
echo "Nomor Yang Anda Masukkan Salah!"
sleep 1
panel-vmess
;;
esac
