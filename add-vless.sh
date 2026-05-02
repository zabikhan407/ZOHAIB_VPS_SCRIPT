#!/bin/bash
clear
P='\033[0;35m' ; C='\033[0;36m' ; G='\033[0;32m' ; NC='\033[0m'

echo -e "${C}CREATE VLESS ACCOUNT${NC}"
read -p "Username : " user
read -p "Duration (Days) : " days
echo -e "Choose Port: [ 443 (TLS) ] or [ 80 (Non-TLS) ]"
read -p "Port : " port
uuid=$(cat /proc/sys/kernel/random/uuid)
exp=`date -d "$days days" +"%d %b %Y"`
domain=$(cat /etc/xray/domain 2>/dev/null || curl -s ipinfo.io/ip)

# Link Generation
if [[ "$port" == "443" ]]; then
    link="vless://$uuid@$domain:443?path=/vless&security=tls&encryption=none&type=ws#$user"
else
    link="vless://$uuid@$domain:80?path=/vless&security=none&encryption=none&type=ws#$user"
fi

clear
echo -e "${C}┌──────────────────────────────────────────────┐${NC}"
echo -e " ${P}Username      :${NC} $user"
echo -e " ${P}UUID          :${NC} $uuid"
echo -e " ${P}Port          :${NC} $port"
echo -e " ${P}Path          :${NC} /vless"
echo -e " ${C}──────────────────────────────────────────────${NC}"
echo -e " ${G}Link Account :${NC}"
echo -e " $link"
echo -e " ${C}──────────────────────────────────────────────${NC}"
echo -e " ${P}Expired On    :${NC} $exp"
echo -e "${C}──────────────────────────────────────────────${NC}"
echo -e "${YL}Copy link kar lein, phir Enter dabayein...${NC}"
read
xray-menu
