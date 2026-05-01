#!/bin/bash
clear
P='\033[0;35m'
C='\033[0;36m'
echo -e "${P}========================================${NC}"
echo -e "           ${C}XRAY (V2RAY) MENU${NC}"
echo -e "${P}========================================${NC}"
echo -e " [ 1 ] Create VLESS Account"
echo -e " [ 2 ] Create VMESS Account"
echo -e " [ 3 ] Create TROJAN Account"
echo -e " [ x ] Back to Main Menu"
echo -e "${P}========================================${NC}"
read -p " Option: " opt
case $opt in
1) add-vless ;;
x) menu ;;
*) xray-menu ;;
esac
