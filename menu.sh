#!/bin/bash

# --- COLORS ---
BIWhite='\033[1;97m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
G='\033[0;32m'
R='\033[0;31m'
NC='\033[0m'
YL='\033[0;33m'

# --- SERVER INFO ---
IP=$(curl -s ipinfo.io/ip)
RAM=$(free -m | awk 'NR==2{printf "%s/%s MB", $3,$2 }')
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-)
CITY=$(curl -s ipinfo.io/city)
DATE=$(date +"%a, %d %b %Y %H:%M:%S")
UPTIME=$(uptime -p | cut -d " " -f 2-)

# --- SERVICE STATUS ---
# (Ye commands check karengi ke service ON hai ya OFF)
status_ssh=$(systemctl is-active ssh)
status_xray=$(systemctl is-active xray)
[[ $status_ssh == "active" ]] && ssh_stat="${G}ON${NC}" || ssh_stat="${R}OFF${NC}"
[[ $status_xray == "active" ]] && xray_stat="${G}ON${NC}" || xray_stat="${R}OFF${NC}"

clear
echo -e "${PURPLE}==================================================${NC}"
echo -e "           ${CYAN}• ZOHAIB NETWORK PROJECT •${NC}"
echo -e "${PURPLE}==================================================${NC}"
echo -e " ${CYAN}OS      :${NC} $(lsb_release -d | cut -f2)"
echo -e " ${CYAN}IP      :${NC} $IP"
echo -e " ${CYAN}RAM     :${NC} $RAM"
echo -e " ${CYAN}ISP     :${NC} $ISP"
echo -e " ${CYAN}CITY    :${NC} $CITY"
echo -e " ${CYAN}DATE    :${NC} $DATE"
echo -e " ${CYAN}UPTIME  :${NC} $UPTIME minutes"
echo -e "${PURPLE}==================================================${NC}"
echo -e " ${CYAN}SSH: $ssh_stat  NGINX: ${G}ON${NC}  X-RAY: $xray_stat${NC}"
echo -e "${PURPLE}==================================================${NC}"
echo -e "           ${CYAN}• SCRIPT MENU •${NC}"
echo -e "${PURPLE}==================================================${NC}"
echo -e " ${CYAN}[ 01 ]${NC} SSH Menu         ${CYAN}[ 06 ]${NC} Bot Menu"
echo -e " ${CYAN}[ 02 ]${NC} XRAY Menu        ${CYAN}[ 07 ]${NC} Backup Menu"
echo -e " ${CYAN}[ 03 ]${NC} Check Online     ${CYAN}[ 08 ]${NC} System Menu"
echo -e " ${CYAN}[ 04 ]${NC} GB Limit Set     ${CYAN}[ 09 ]${NC} ISP Tracking"
echo -e " ${CYAN}[ 05 ]${NC} Trojan Menu      ${CYAN}[ 10 ]${NC} Domain/SNI Check"
echo -e ""
echo -e " ${CYAN}[•x ]${NC} Exit Panel"
echo -e "${PURPLE}==================================================${NC}"
echo -e " ${CYAN}Client Name   :${NC} ZOHAIB_NETWORK"
echo -e " ${CYAN}Scrip Version :${NC} V1.0 Special Edition"
echo -e "${PURPLE}==================================================${NC}"
echo -n -e " ${G}Select menu :${NC} "
read opt
