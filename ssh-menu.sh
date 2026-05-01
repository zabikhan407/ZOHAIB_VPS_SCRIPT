#!/bin/bash
clear
P='\033[0;35m'
C='\033[0;36m'
echo -e "${P}========================================${NC}"
echo -e "           ${C}SSH WS MENU${NC}"
echo -e "${P}========================================${NC}"
echo -e " [ 1 ] Create SSH WebSocket Account"
echo -e " [ 2 ] Delete SSH Account"
echo -e " [ x ] Back to Main Menu"
echo -e "${P}========================================${NC}"
read -p " Option: " opt
case $opt in
1) add-ssh ;;
x) menu ;;
*) ssh-menu ;;
esac
