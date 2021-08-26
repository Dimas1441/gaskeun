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
echo -e "   ${green}PANEL TROJAN & TROJAN-GO ${off}"
echo -e "${red}======================================${off}"
echo -e "${white}"
echo -e "     1 =>  Buat Akun Trojan          5 =>  Buat Akun Trojan-Go"
echo -e "     2 =>  Hapus Akun Trojan      6 =>  Hapus Akun Trojan-Go"
echo -e "     3 =>  Perbarui Akun Trojan  7 =>  Perbarui Akun Trojan-Go"
echo -e "     4 =>  Cek Login Trojan          8 =>  Cek Login Trojan-Go"
echo -e "     x =>  Keluar"
echo -e "${off}"
echo -e "${red}======================================${off}"
echo -e "${white}"
read -p "     Pilih nomor  [1-8 / x] :  " port
echo -e "${off}"

case $port in
1)
add-tr
;;
2)
del-tr
;;
3)
renew-tr
;;
4)
cek-tr
;;
5)
add-trgo
;;
6)
del-trgo
;;
7)
renew-trgo
;;
8)
cek-trgo
;;
x)
clear
menu
;;
*)
echo "Nomor Yang Anda Masukkan Salah!"
sleep 0.5
panel-trojan
;;
esac
