#!/bin/bash

# --- RANG (Colors) ---
P='\033[0;35m' # Purple
C='\033[0;36m' # Cyan
G='\033[0;32m' # Green
R='\033[0;31m' # Red
NC='\033[0m'   # No Color

# --- AUTOMATION FIX (Taake script na ruke) ---
export DEBIAN_FRONTEND=noninteractive

# --- LICENSE CHECK ---
MYIP=$(wget -qO- ipv4.icanhazip.com)
REPO_URL="https://raw.githubusercontent.com/zabikhan407/ZOHAIB_VPS_SCRIPT/main"

clear
echo -e "${P}==================================================${NC}"
echo -e "          ${C}CHECKING YOUR LICENSE...${NC}"
echo -e "${P}==================================================${NC}"
sleep 1

VALID_IP=$(curl -sS ${REPO_URL}/permission.txt | grep -w $MYIP)

if [[ $VALID_IP ]]; then
    echo -e "${G}LICENSE VALID!${NC}"
else
    echo -e "${R}ACCESS DENIED! IP ($MYIP) Register nahi hai.${NC}"
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
echo -e "          ${P}• ZOHAIB NETWORK PROJECT •${NC}"
echo -e "${P}==================================================${NC}"

# --- INSTALLATION SHURU (Visible Progress) ---

echo -e "${G}[STEP 1]${NC} System Update aur Packages Install ho rahe hain..."
# Yahan se progress nazar ayegi
apt-get update
apt-get upgrade -y -o Dpkg::Options::="--force-confold"

echo -e "\n${G}[STEP 2]${NC} Zaroori Tools Install ho rahe hain..."
apt-get install jq curl socat xz-utils wget net-tools -y

echo -e "\n${G}[STEP 3]${NC} Xray Core (V2ray) Install ho raha hai..."
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

echo -e "\n${G}[STEP 4]${NC} Menu aur Folders Setup ho rahe hain..."
mkdir -p /etc/zohaib/
mkdir -p /var/log/xray/
wget -q -O /usr/bin/menu "${REPO_URL}/menu.sh"
chmod +x /usr/bin/menu

echo -e "\n${P}==================================================${NC}"
echo -e "      ${G}MUBARAK HO! INSTALLATION MUKAMMAL${NC}"
echo -e "${P}==================================================${NC}"
echo -e "${C}Ab aap sirf 'menu' likh kar panel khol sakte hain.${NC}"
