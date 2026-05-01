#!/bin/bash

# --- RANG (Colors) ---
P='\033[0;35m'
C='\033[0;36m'
G='\033[0;32m'
NC='\033[0m'

# --- LICENSE CHECK ---
MYIP=$(wget -qO- ipv4.icanhazip.com)
REPO_URL="https://raw.githubusercontent.com/zabikhan407/ZOHAIB_VPS_SCRIPT/main"
VALID_IP=$(curl -sS ${REPO_URL}/permission.txt | grep -w $MYIP)

if [[ ! $VALID_IP ]]; then
    echo "ACCESS DENIED!"
    exit 1
fi

# --- 1. HEAVY INSTALLATION (No Banners Here) ---
echo -e "${C}ZOHAIB_NETWORK: Installing dependencies, please wait...${NC}"

export DEBIAN_FRONTEND=noninteractive
apt-get update -y > /dev/null 2>&1
apt-get install jq curl socat xz-utils wget net-tools -y > /dev/null 2>&1

# Xray Core Install
echo -e "${C}ZOHAIB_NETWORK: Setting up Xray Core...${NC}"
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install > /dev/null 2>&1

# Menu aur Folders
mkdir -p /etc/zohaib/
mkdir -p /var/log/xray/
wget -q -O /usr/bin/menu "${REPO_URL}/menu.sh"
chmod +x /usr/bin/menu

# --- 2. FINAL FINISH (Banner at the End) ---
clear
echo -e "${P}==================================================${NC}"
echo -e "${C}  ███████╗ ██████╗ ██╗  ██╗ █████╗ ██╗██████╗   ${NC}"
echo -e "${C}  ╚══███╔╝██╔═══██╗██║  ██║██╔══██╗██║██╔══██╗  ${NC}"
echo -e "${C}    ███╔╝ ██║   ██║███████║███████║██║██████╔╝  ${NC}"
echo -e "${C}   ███╔╝  ██║   ██║██╔══██║██╔══██║██║██╔══██╗  ${NC}"
echo -e "${C}  ███████╗╚██████╔╝██║  ██║██║  ██║██║██████╔╝  ${NC}"
echo -e "${C}  ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═════╝   ${NC}"
echo -e "          ${P}• ZOHAIB NETWORK PROJECT •${NC}"
echo -e "${P}==================================================${NC}"
echo -e " ${G}MUBARAK HO! SCRIPT SUCCESSFULLY INSTALL HO GAYI.${NC}"
echo -e " ${C}Ab aap sirf ${G}'menu'${C} likh kar panel khol sakte hain.${NC}"
echo -e "${P}==================================================${NC}"
