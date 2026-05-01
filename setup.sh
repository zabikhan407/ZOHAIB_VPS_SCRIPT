#!/bin/bash
REPO_URL="https://raw.githubusercontent.com/zabikhan407/ZOHAIB_VPS_SCRIPT/main"

# 1. Update & Tools (Visual)
echo "ZOHAIB_NETWORK: Starting Installation..."
apt update && apt upgrade -y
apt install jq curl socat xz-utils wget net-tools -y

# 2. Xray & Webserver
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

# 3. Download Menu
wget -O /usr/bin/menu "${REPO_URL}/menu.sh" && chmod +x /usr/bin/menu

# Yahan hum bad mein aur files add karenge jise add-ssh, add-vless wagera
clear
echo "ZOHAIB_NETWORK: Installation Mukammal!"
echo "Type 'menu' to start."
