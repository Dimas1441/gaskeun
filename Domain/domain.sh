#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
apt install jq curl -y
DOMAIN=premium-server.xyz
sub=$(</dev/urandom tr -dc a-z0-9 | head -c4)
echo $sub > /root/cfku
SUB_DOMAIN=${sub}.premium-server.xyz
CF_ID=afdhan134@gmail.com
CF_KEY=57fc95a923222474d5b90ff5444e0ee6f19ef
set -euo pipefail
IP=$(wget -qO- ipinfo.io/ip);
echo "Record DNS ${SUB_DOMAIN}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${SUB_DOMAIN}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}')
echo "Host : $SUB_DOMAIN"
echo $SUB_DOMAIN > /root/domain
sleep 0.5
wget -O /usr/bin/domain1 "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Domain/domain1.sh"
wget -O /usr/bin/domain2 "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Domain/domain2.sh"
wget -O /usr/bin/domain3 "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Domain/domain3.sh"
wget -O /usr/bin/domain4 "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Domain/domain4.sh"
wget -O /usr/bin/nginx "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/Domain/nginx.sh"

chmod +x /usr/bin/domain1
chmod +x /usr/bin/domain2
chmod +x /usr/bin/domain3
chmod +x /usr/bin/domain4
chmod +x /usr/bin/nginx

echo -e "Done Record Domain For VPS" | lolcat
figlet -f slant BRODY | lolcat
sleep 1

rm -f /root/domain.sh
