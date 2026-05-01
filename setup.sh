#!/bin/bash
# ZOHAIB_NETWORK Master Installer
export DEBIAN_FRONTEND=noninteractive
P='\033[0;35m' ; C='\033[0;36m' ; G='\033[0;32m' ; NC='\033[0m'

# 1. License Check Bypass (Abhi ke liye band hai taake aapka kaam na ruke)
MYIP=$(wget -qO- ipv4.icanhazip.com)
REPO_URL="https://raw.githubusercontent.com/zabikhan407/ZOHAIB_VPS_SCRIPT/main"

clear
echo -e "${P}========================================${NC}"
echo -e "${C}      INSTALLING ZOHAIB_NETWORK...      ${NC}"
echo -e "${P}========================================${NC}"

# 2. System Update & Heavy Tools
echo -e "${G}[1/4]${NC} Installing System Tools..."
apt-get update && apt-get upgrade -y
apt-get install jq curl socat xz-utils wget net-tools python3 nginx certbot python3-certbot-nginx -y

# 3. Xray Installation
echo -e "${G}[2/4]${NC} Setting up Xray Core..."
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

# 4. Download ALL Professional Components
echo -e "${G}[3/4]${NC} Downloading Panel Modules..."
# List of files to download
files=("menu.sh" "ssh-menu.sh" "xray-menu.sh" "add-ssh.sh" "add-vless.sh" "check-online.sh" "limit-gb.sh" "domain-setup.sh")

for file in "${files[@]}"; do
    # File download karke /usr/bin mein dalna taake direct command ban jaye
    wget -q -O /usr/bin/${file%.sh} "${REPO_URL}/${file}"
    chmod +x /usr/bin/${file%.sh}
done

# 5. Create Database Folders
mkdir -p /etc/zohaib/
mkdir -p /var/log/xray/
touch /etc/zohaib/ssh-users.db

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
echo -e " ${G}INSTALLATION MUKAMMAL HO GAYI HAI!${NC}"
echo -e " ${C}Ab sirf ${G}'menu'${C} likhein aur panel use karein.${NC}"
echo -e "${P}==================================================${NC}"
