#!/bin/bash
clear
P='\033[0;35m' ; C='\033[0;36m' ; G='\033[0;32m' ; NC='\033[0m'
read -p "Username : " user
read -p "Password : " pass
read -p "Days     : " days
exp=`date -d "$days days" +"%d %b %Y"`
useradd -e `date -d "$days days" +"%Y-%m-%d"` -M -s /bin/false $user
echo "$user:$pass" | chpasswd
host=$(curl -s ipinfo.io/ip)
domain=$(cat /etc/xray/domain 2>/dev/null || echo $host)

clear
echo -e "${C}┌──────────────────────────────────────────────┐${NC}"
echo -e "${C}│            ${P}SSH OVPN Account${C}                  │${NC}"
echo -e "${C}└──────────────────────────────────────────────┘${NC}"
echo -e " ${P}Username      :${NC} $user"
echo -e " ${P}Password      :${NC} $pass"
echo -e " ${C}──────────────────────────────────────────────${NC}"
echo -e " ${P}IP/Host       :${NC} $domain"
echo -e " ${P}Port SSH WS   :${NC} 80, 2082"
echo -e " ${P}Port SSL/TLS  :${NC} 443"
echo -e " ${C}──────────────────────────────────────────────${NC}"
echo -e " ${P}Payload WSS   :${NC} GET /ssh HTTP/1.1[crlf]Host:"
echo -e " ${P}$domain[crlf]Upgrade: websocket[crlf][crlf]${NC}"
echo -e " ${C}──────────────────────────────────────────────${NC}"
echo -e " ${P}Aktif Selama  :${NC} $days Hari (Exp: $exp)"
echo -e "${C}──────────────────────────────────────────────${NC}"
read -p "Press Enter to back" ; ssh-menu
