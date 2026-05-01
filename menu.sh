#!/bin/bash
P='\033[0;35m' # Purple
C='\033[0;36m' # Cyan
NC='\033[0m'

# Server Information
IP=$(curl -s ipinfo.io/ip)
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-)
CITY=$(curl -s ipinfo.io/city)

clear
echo -e "${P}==================================================${NC}"
echo -e "          ${C}• ZOHAIB NETWORK PROJECT •${NC}"
echo -e "${P}==================================================${NC}"
echo -e " ${C}IP ADDRESS :${NC} $IP"
echo -e " ${C}ISP/NETWORK:${NC} $ISP"
echo -e " ${C}LOCATION   :${NC} $CITY"
echo -e "${P}==================================================${NC}"
echo -e " ${C}[ 01 ]${NC} Create VLESS Account"
echo -e " ${C}[ 02 ]${NC} Delete Account"
echo -e " ${C}[ 03 ]${NC} Check Online Users (ISP/SNI)"
echo -e " ${C}[ 04 ]${NC} GB Limit Settings"
echo -e " ${C}[ x ]${NC} Exit Panel"
echo -e "${P}==================================================${NC}"
read -p " Select menu :  " opt

case $opt in
1) add-vless ;; # Hum ye file agle step mein banayenge
3) check-online ;; # ISP detection wala tool
x) exit ;;
*) menu ;;
esac
