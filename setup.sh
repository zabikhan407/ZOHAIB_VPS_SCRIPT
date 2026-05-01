#!/bin/bash
# ZOHAIB_NETWORK Professional Setup
P='\033[0;35m'
C='\033[0;36m'
G='\033[0;32m'
NC='\033[0m'

REPO_URL="https://raw.githubusercontent.com/zabikhan407/ZOHAIB_VPS_SCRIPT/main"

# 1. Server Preparation
echo -e "${C}ZOHAIB_NETWORK: Installing Core Engines...${NC}"
apt update && apt upgrade -y
apt install jq curl socat xz-utils wget net-tools python3 nginx certbot python3-certbot-nginx -y

# 2. Xray Core & SSH WS Setup
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install
mkdir -p /etc/zohaib/
mkdir -p /var/log/xray/

# 3. Download All Functional Scripts
echo -e "${C}ZOHAIB_NETWORK: Downloading Functions...${NC}"
files=("menu.sh" "ssh-menu.sh" "xray-menu.sh" "add-vless.sh" "add-ssh.sh" "check-online.sh")
for file in "${files[@]}"; do
    wget -O /usr/bin/${file%.sh} "${REPO_URL}/${file}"
    chmod +x /usr/bin/${file%.sh}
done

# 4. Domain SSL Setup (Placeholder - User will run manually from menu)
clear
echo -e "${P}==================================================${NC}"
echo -e " ${G}INSTALLATION MUKAMMAL!${NC}"
echo -e " ${C}Domain point hai to ab 'menu' likhein.${NC}"
echo -e "${P}==================================================${NC}"
