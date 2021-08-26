#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
echo "Untuk Melakukan Tindakan Ini, Anda Harus Laporan Terlebih Dahulu Kepada Pihak Admin."
echo "Agar Diberikan Akses Pembaruan Pada Script VPS Anda!"
read -p "Sudah Laporan? [Y/N]:" arg
if [[ $arg == 'Y' ]]; then
  echo "Tindakan Diteruskan!"
  figlet -f slant Memperbarui... | lolcat
elif [[ $arg == 'y' ]]; then
  echo "Tindakan Diteruskan!"
  figlet -f slant Memperbarui... | lolcat
elif [[ $arg == 'N' ]]; then
  echo "Tindakan Dihentikan!"
  sleep 1
  clear
  neofetch
  exit 0
elif [[ $arg == 'n' ]]; then
  echo "Tindakan Dihentikan!"
  sleep 1
  clear
  neofetch
  exit 0
else
  echo "Argumen Tidak Diketahui!"
  sleep 1
  clear
  neofetch
  exit 0
fi
sleep 1

if [ ! -e /home/vps/public_html/TCP.ovpn ]; then
cp /etc/openvpn/client-tcp-1194.ovpn /home/vps/public_html/TCP.ovpn
cp /etc/openvpn/client-udp-2200.ovpn /home/vps/public_html/UDP.ovpn
cp /etc/openvpn/client-tcp-ssl.ovpn /home/vps/public_html/SSL.ovpn

mkdir /root/OpenVPN
cp -r /etc/openvpn/client-tcp-ssl.ovpn OpenVPN/SSL.ovpn
cp -r /etc/openvpn/client-udp-2200.ovpn OpenVPN/UDP.ovpn
cp -r /etc/openvpn/client-tcp-1194.ovpn OpenVPN/TCP.ovpn
cd /root
zip -r openvpn.zip OpenVPN > /dev/null 2>&1
cp -r /root/openvpn.zip /home/vps/public_html/ALL.zip
rm -rf /root/OpenVPN
rm -f /root/openvpn.zip
fi

figlet -f slant Waiting Update... | lolcat
sleep 1
#ssr
wget -O /usr/bin/panel-ssr https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Ssr/panel-ssr.sh && chmod +x /usr/bin/panel-ssr
wget -O /usr/bin/ssr https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Ssr/ssrmu && chmod +x /usr/bin/ssr
wget -O /usr/bin/add-ssr https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Ssr/add-ssr.sh && chmod +x /usr/bin/add-ssr
wget -O /usr/bin/del-ssr https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Ssr/del-ssr.sh && chmod +x /usr/bin/del-ssr
wget -O /usr/bin/renew-ssr https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Ssr/renew-ssr.sh && chmod +x /usr/bin/renew-ssr
#l2tp
wget -O /usr/bin/ panel-l2tp https://raw.githubusercontent.com/Dimas1441/gaskeun/main/panel-l2tp.sh && chmod +x /usr/bin/panel-l2tp
wget -O /usr/bin/add-l2tp https://raw.githubusercontent.com/Dimas1441/gaskeun/main/L2tp/add-l2tp.sh && chmod +x /usr/bin/add-l2tp
wget -O /usr/bin/del-l2tp https://raw.githubusercontent.com/Dimas1441/gaskeun/main/L2tp/del-l2tp.sh && chmod +x /usr/bin/del-l2tp
wget -O /usr/bin/renew-l2tp https://raw.githubusercontent.com/Dimas1441/gaskeun/main/L2tp/renew-l2tp.sh && chmod +x /usr/bin/renew-l2tp
#pptp
wget -O /usr/bin/add-pptp https://raw.githubusercontent.com/Dimas1441/gaskeun/main/sstp/add-pptp.sh && chmod +x /usr/bin/add-pptp
wget -O /usr/bin/del-pptp https://raw.githubusercontent.com/Dimas1441/gaskeun/main/sstp/del-pptp.sh && chmod +x /usr/bin/del-pptp
wget -O /usr/bin/renew-pptp https://raw.githubusercontent.com/Dimas1441/gaskeun/main/sstp/renew-pptp.sh && chmod +x /usr/bin/renew-pptp
#sstp
wget -O /usr/bin/panel-sstp https://raw.githubusercontent.com/Dimas1441/gaskeun/main/sstp/panel-sstp.sh && chmod +x /usr/bin/panel-sstp
wget -O /usr/bin/add-sstp https://raw.githubusercontent.com/Dimas1441/gaskeun/main/sstp/add-sstp.sh && chmod +x /usr/bin/add-sstp
wget -O /usr/bin/del-sstp https://raw.githubusercontent.com/Dimas1441/gaskeun/main/sstp/del-sstp.sh && chmod +x /usr/bin/del-sstp
wget -O /usr/bin/cek-sstp https://raw.githubusercontent.com/Dimas1441/gaskeun/main/sstp/cek-sstp.sh && chmod +x /usr/bin/cek-sstp
wget -O /usr/bin/renew-sstp https://raw.githubusercontent.com/Dimas1441/gaskeun/main/sstp/renew-sstp.sh && chmod +x /usr/bin/renew-sstp
#SHADOWSOCKS
cd /usr/bin
wget -O add-ss "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/sadosok/add-ss.sh"
wget -O del-ss "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/sadosok/del-ss.sh"
wget -O cek-ss "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/sadosok/cek-ss.sh"
wget -O renew-ss "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/sadosok/renew-ss.sh"
chmod +x add-ss
chmod +x del-ss
chmod +x cek-ss
chmod +x renew-ss
#PANEL-PORT
cd /usr/bin
wget -O panel-port "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-port/panel-port.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-port/port-ovpn.sh"
wget -O port-ssl "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-port/port-ssl.sh"
wget -O port-wg "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-port/port-wg.sh"
wget -O port-tr "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-port/port-tr.sh"
wget -O port-sstp "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-port/port-sstp.sh"
wget -O port-squid "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-port/port-squid.sh"
wget -O port-ws "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-port/port-ws.sh"
wget -O port-vless "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-port/port-vless.sh"
chmod +x panel-port
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-tr
chmod +x port-sstp
chmod +x port-squid
chmod +x port-ws
chmod +x port-vless
#PANEL SSH
cd /usr/bin
wget -O panel-ssh "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-ssh/panel-ssh.sh"
wget -O usernew "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-ssh/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-ssh/trial.sh"
wget -O hapus "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-ssh/hapus.sh"
wget -O member "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-ssh/member.sh"
wget -O delete "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-ssh/delete.sh"
wget -O cek "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-ssh/cek.sh"
wget -O renew "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-ssh/renew.sh"
wget -O autokill "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-ssh/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-ssh/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-ssh/tendang.sh"
chmod +x panel-ssh
chmod +x usernew
chmod +x trial
chmod +x hapus
chmod +x member
chmod +x delete
chmod +x cek
chmod +x renew
chmod +x autokill
chmod +x ceklim
chmod +x tendang
#PANEL V2RAY VMESS
cd /usr/bin
wget -O panel-vmess "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-vmess/wss.sh"
wget -O add-ws "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-vmess/add-ws.sh"
wget -O del-ws "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-vmess/del-ws.sh"
wget -O cek-ws "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-vmess/cek-ws.sh"
wget -O renew-ws "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-vmess/renew-ws.sh"
wget -O certv2ray "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-vmess/certv2ray.sh"
wget -O trialws "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-vmess/trialws.sh"
chmod +x panel-vmess
chmod +x add-ws
chmod +x del-ws
chmod +x cek-ws
chmod +x renew-ws
chmod +x certv2ray
chmod +x trialws
#PANEL V2RAY VLESS
cd /usr/bin
wget -O panel-vless "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-vless/panel-vless.sh"
wget -O add-vless "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-vless/add-vless.sh"
wget -O del-vless "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-vless/del-vless.sh"
wget -O cek-vless "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-vless/cek-vless.sh"
wget -O renew-vless "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-vless/renew-vless.sh"
chmod +x panel-vless
chmod +x add-vless
chmod +x del-vless
chmod +x cek-vmess
chmod +x renew-vless
#PANEL-TROJAN
cd /usr/bin
wget -O panel-trojan "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-trojan/panel-trojan.sh"
wget -O add-tr "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-trojan/add-tr.sh"
wget -O del-tr "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-trojan/del-tr.sh"
wget -O renew-tr "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-trojan/renew-tr.sh"
wget -O cek-tr "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-trojan/cek-tr.sh"
wget -O add-trgo "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-trojan/add-trgo.sh"
wget -O del-trgo "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-trojan/del-trgo.sh"
wget -O renew-trgo "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-trojan/renew-trgo.sh"
wget -O cek-trgo "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-trojan/cek-trgo.sh"
chmod +x panel-trojan
chmod +x add-tr
chmod +x del-tr
chmod +x renew-tr
chmod +x cek-tr
chmod +x add-trgo
chmod +x del-trgo
chmod +x renew-trgo
chmod +x cek-trgo
#PANEL WIREGUARD
cd /usr/bin
wget -O panel-wireguard "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-wireguard/panel-wireguard.sh"
wget -O add-wg "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-wireguard/add-wg.sh"
wget -O del-wg "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-wireguard/del-wg.sh"
wget -O cek-wg "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-wireguard/cek-wg.sh"
wget -O renew-wg "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Panel-wireguard/renew-wg.sh"
chmod +x panel-wireguard
chmod +x add-wg
chmod +x del-ws
chmod +x cek-wg
chmod +x renew.wg
#bahan
cd /usr/bin
wget -O resett "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/bahan/resett.sh"
wget -O add-host "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/bahan/add-host.sh"
wget -O about "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/bahan/about.sh"
wget -O menu "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/bahan/menu.sh"
wget -O ram "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/bahan/ram.sh"
wget -O wbmn "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/bahan/webmin.sh"
wget -O xp "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/bahan/xp.sh"
wget -O xp-ws "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/bahan/xp-ws.sh"
wget -O xp-trgo "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/bahan/xp-trgo.sh"
chmod +x resett
chmod +x add-host
chmod +x about
chmod +x menu
chmod +x ram
chmod +x wbmn
chmod +x xp
chmod +x xp-ws
chmod +x xp-trgo
#bahan
cd /usr/bin
wget -O restart "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/bahan/restart.sh"
wget -O info "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/bahan/info.sh"
wget -O speedtest "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/bahan/speedtest_cli.py"
wget -O updatee "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/bahan/updatee.sh"
wget -O hostnya "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/bahan/host.sh"
wget -O auto-reboot "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/bahan/auto-reboot.sh"
wget -O status "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/bahan/status.sh"
wget -O bw "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/bahan/bandwith.sh"
wget -O clear-log "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/bahan/clear-log.sh"
chmod +x restart
chmod +x info
chmod +x speedtest
chmod +x updatee
chmod +x hostnya
chmod +x auto-reboot
chmod +x status
chmod +x bw
chmod +x clear-log
echo "0 0 * * * root clear-log && xp" >> /etc/crontab
echo "*/10 * * * * root xp-ws" >> /etc/crontab

cd
systemctl restart cron
echo "1.0.1" > /home/ver
clear
figlet -f slant UPDATE | lolcat
rm -f updatee.sh
sleep 5
clear
neofetch
