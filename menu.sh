#!/bin/bash
P='\033[0;35m'
C='\033[0;36m'
G='\033[0;32m'
NC='\033[0m'

IP=$(curl -s ipinfo.io/ip)
RAM=$(free -m | awk 'NR==2{printf "%s/%s MB", $3,$2 }')
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-)
UPTIME=$(uptime -p)

clear
echo -e "${P}==================================================${NC}"
echo -e "           ${C}• ZOHAIB NETWORK PROJECT •${NC}"
echo -e "${P}==================================================${NC}"
echo -e " ${C}IP      :${NC} $IP"
echo -e " ${C}RAM     :${NC} $RAM"
echo -e " ${C}ISP     :${NC} $ISP"
echo -e " ${C}UPTIME  :${NC} $UPTIME"
echo -e "${P}==================================================${NC}"
echo -e " ${C}[ 01 ]${NC} SSH Menu         ${C}[ 06 ]${NC} Bot Menu"
echo -e " ${C}[ 02 ]${NC} XRAY Menu        ${C}[ 07 ]${NC} Backup Menu"
echo -e " ${C}[ 03 ]${NC} Check Online     ${C}[ 08 ]${NC} System Menu"
echo -e " ${C}[ 04 ]${NC} GB Limit Set     ${C}[ 09 ]${NC} ISP Tracking"
echo -e " ${C}[ 05 ]${NC} Trojan Menu      ${C}[ 10 ]${NC} Domain Setup"
echo -e "${P}==================================================${NC}"
read -p " Select menu : " opt
case $opt in
1 | 01) ssh-menu ;;
2 | 02) xray-menu ;;
3 | 03) check-online ;;
x) exit ;;
*) menu ;;
esac
