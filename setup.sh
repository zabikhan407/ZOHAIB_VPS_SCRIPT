#!/bin/bash

# --- RANG (Colors) ---
P='\033[0;35m' # Purple
C='\033[0;36m' # Cyan
G='\033[0;32m' # Green
R='\033[0;31m' # Red
NC='\033[0m'   # No Color

# --- LICENSE CHECK ---
MYIP=$(wget -qO- ipv4.icanhazip.com)
REPO_URL="https://raw.githubusercontent.com/zabikhan407/ZOHAIB_VPS_SCRIPT/main"

clear
echo -e "${P}==================================================${NC}"
echo -e "          ${C}CHECKING YOUR LICENSE...${NC}"
echo -e "${P}==================================================${NC}"
sleep 2

VALID_IP=$(curl -sS ${REPO_URL}/permission.txt | grep -w $MYIP)

if [[ $VALID_IP ]]; then
    echo -e "${G}LICENSE VALID! Khush-Aamdeed.${NC}"
else
    echo -e "${R}ACCESS DENIED! Aapka IP ($MYIP) Register nahi hai.${NC}"
    echo -e "${C}Admin se rabta karein: @zabikhan407${NC}"
    exit 1
fi

# --- PIYARA BANNER (ZOHAIB_NETWORK) ---
clear
echo -e "${P}==================================================${NC}"
echo -e "${C}  ███████╗ ██████╗ ██╗  ██╗ █████╗ ██╗██████╗   ${NC}"
echo -e "${C}  ╚══███╔╝██╔═══██╗██║  ██║██╔══██╗██║██╔══██╗  ${NC}"
echo -e "${C}    ███╔╝ ██║   ██║███████║███████║██║██████╔╝  ${NC}"
echo -e "${C}   ███╔╝  ██║   ██║██╔══██║██╔══██║██║██╔══██╗  ${NC}"
echo -e "${C}  ███████╗╚██████╔╝██║  ██║██║  ██║██║██████╔╝  ${NC}"
echo -e "${C}  ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═════╝   ${NC}"
echo -e "          ${P}• NETWORK PROJECT SCRIPT •${NC}"
echo -e "${P}==================================================${NC}"
echo -e " ${C}OS      :${NC} $(lsb_release -d | cut -f2)"
echo -e " ${C}IP      :${NC} $MYIP"
echo -e " ${C}OWNER   :${NC} ZOHAIB_NETWORK"
echo -e "${P}==================================================${NC}"
echo -e ""

# --- INSTALLATION SHURU ---
echo -e "${C}[1/3]${NC} System Tools Install ho rahe hain..."
apt update && apt upgrade -y > /dev/null 2>&1
apt install jq curl socat xz-utils wget net-tools -y > /dev/null 2>&1

echo -e "${C}[2/3]${NC} Xray Core Install ho raha hai..."
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install > /dev/null 2>&1

echo -e "${C}[3/3]${NC} Directories ban rahi hain..."
mkdir -p /etc/zohaib/
mkdir -p /var/log/xray/

echo -e ""
echo -e "${G}Mubarak Ho! ZOHAIB_NETWORK Script Install Ho Gayi Hai.${NC}"
echo -e "${P}--------------------------------------------------${NC}"
echo -e "Ab hum agle step mein 'menu' file banayenge."
