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
echo -e "             ${white}PANEL SSTP${off}"
echo -e "${red}======================================${off}"
echo -e "${green}"
echo -e "     1 =>  Buat Akun SSTP"
echo -e "     2 =>  Hapus Akun SSTP"
echo -e "     3 =>  Perbarui Akun SSTP"
echo -e "     4 =>  Cek Login SSTP"
echo -e "     x =>  Keluar"
echo -e "${off}"
echo -e "${red}======================================${off}"
echo -e "${white}"
read -p "     Pilih Nomor [1-4 / x] :  " port
echo -e "${off}"

case $port in
1)
add-sstp
;;
2)
del-sstp
;;
3)
renew-sstp
;;
4)
cek-sstp
;;
x)
clear
menu
;;
*)
echo "Nomor Yang Anda Masukkan Salah!"
sleep 1
panel-sstp
;;
esac
