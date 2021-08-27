#!/bin/bash

#Kami tidak bertanggung jawab jika anda mengedit/merubah ini!

clear
figlet -f slant KANG BRODY | lolcat
mer='\x1b[91m'
cyan='\x1b[96m'
off='\x1b[m'

if [[ -e /etc/debian_version ]]; then
	OS=debian
	RCLOCAL='/etc/rc.local'
elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
	OS=centos
	RCLOCAL='/etc/rc.d/rc.local'
	chmod +x /etc/rc.d/rc.local
else
        echo -e "${mer}OS TIDAK SUPPORT !!!${off}"
	echo -e "${mer}Scripy Install Hanya Bekerja Pada Operating System Debian, Ubuntu dan Centos${off}"
	exit 0
fi
declare -A nama_bulan
nama_bulan[Jan]="Januari"
nama_bulan[Feb]="Februari"
nama_bulan[Mar]="Maret"
nama_bulan[Apr]="April"
nama_bulan[May]="Mei"
nama_bulan[Jun]="Juni"
nama_bulan[Jul]="Juli"
nama_bulan[Aug]="Agustus"
nama_bulan[Sep]="September"
nama_bulan[Oct]="Oktober"
nama_bulan[Nov]="November"
nama_bulan[Dec]="Desember"
bulan_ini=`date +%b`

color3='\e[031;1m'
color2='\e[34;1m'
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
COUNTRY=$(curl -s ipinfo.io/country )
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
jam=$(TZ='Asia/Jakarta' date +%R)
hari=$(date +"%A")
tnggl=$(date +"%d")
bln=${nama_bulan[$bulan_ini]}
thn=$(date +"%Y")
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
swap=$( free -m | awk 'NR==4 {print $2}' )
up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
	
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "                    BRODY" | lolcat
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e " ${white}Zona Waktu             :  Asia/Jakarta ${NC}"
echo -e " ${white}Waktu                  :  $jam WIB ${NC}"
echo -e " ${white}Hari                   :  $hari ${NC}"
echo -e " ${white}Tanggal                :  $tnggl $bln $thn ${NC}"
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e " ${white}Model CPU              : $cname ${NC}"
echo -e " ${white}Nomor Core             :  $cores ${NC}"
echo -e " ${white}Frekuensi CPU          : $freq MHz ${NC}"
echo -e " ${white}Jumlah RAM             :  $tram MB ${NC}"
echo -e " ${white}Jumlah Swap            :  $swap MB ${NC}"
echo -e " ${white}Waktu Aktif            : $up ${NC}"
echo -e " ${white}ISP                    :  $ISP ${NC}"
echo -e " ${white}COUNTRY                :  $COUNTRY ${NC}"
echo -e " ${white}CITY                   :  $CITY ${NC}"
echo -e " ${white}IP VPS                 :  $IPVPS ${NC}"
echo -e " ${white}Host VPS               :  $domain ${NC}"
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "                      MENU TUNNELING " | lolcat
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "${white}"
echo -e " 1 =>  Panel SSH & OVPN         5 =>  Panel SSR & Shadowsocks"
echo -e " 2 =>  Panel Wireguard          6 =>  Panel VMess"
echo -e " 3 =>  Panel L2TP & PPTP        7 =>  Panel VLess"
echo -e " 4 =>  Panel SSTP               8 =>  Panel Trojan & Trojan-go"
echo -e "${off}"
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "                        MENU SYSTEM " | lolcat
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "${white}"
echo -e "  9 =>  Masukkan Host          20 =>  Limit Speed"
echo -e " 10 =>  Record Domain          21 =>  Ram VPS"
echo -e " 11 =>  Sertifikat V2RAY       22 =>  Ganti Password"
echo -e " 12 =>  Ubah Port VPN          23 =>  Reboot"
echo -e " 13 =>  Autobackup VPS         24 =>  Speedtest"
echo -e " 14 =>  Backup VPS             25 =>  Informasi System"
echo -e " 15 =>  Restore VPS            26 =>  Info Script"
echo -e " 16 =>  Menu Webmin            27 =>  Restart Service"
echo -e " 17 =>  Auto Reboot            28 =>  Multi Login SSH"
echo -e " 18 =>  Edit Banner SSH        29 =>  Restart Script"
echo -e " 19 =>  Status Service         30 =>  Monitor Bandwith"
echo -e "${off}"
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "  ${white}x =>  Keluar Dari Terminal${off}"
echo -e "${red}══════════════════════════════════════════════════════════${NC}"
echo -e "${white}"
read -p " [ # ] Masukkan Nomor Pilihanmu :  "  num
echo -e "${off}"

case $num in
1)
panel-ssh
;;

2)
panel-wireguard
;;

3)
panel-l2tp
;;

4)
panel-sstp
;;

5)
panel-ssr
;;

6)
panel-vmess
;;

7)
panel-vless
;;

8)
panel-trojan
;;

9)
add-host
;;

10)
hostnya
;;

11)
certv2ray
;;

12)
panel-port
;;

13)
autobackup
;;

14)
backup
;;

15)
restore
;;

16)
wbmn
;;

17)
auto-reboot
;;

18)
nano /etc/issue.net
;;

19)
status
;;

20)
limit-speed
;;

21)
ram
;;

22)
passwd
;;

23)
reboot
;;

24)
speedtest
;;

25)
info
;;

26)
about
;;

27)
restart
;;

28)
autokill
;;

29)
updatee
;;

30)
bw
;;

x)
exit
;;

*)
echo -e "${mer}Nomor Yang Anda Masukkan Salah!${off}"
sleep 1
clear
menu
;;
esac
