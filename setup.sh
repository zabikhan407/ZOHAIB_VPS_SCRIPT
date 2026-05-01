#!/bin/bash

# 1. License Check
MYIP=$(wget -qO- ipv4.icanhazip.com)
# Aapka GitHub link
REPO_URL="https://raw.githubusercontent.com/zabikhan407/ZOHAIB_VPS_SCRIPT/main"

echo -e "Checking License for IP: $MYIP..."
sleep 2

# Permission list check karna
VALID_IP=$(curl -sS ${REPO_URL}/permission.txt | grep -w $MYIP)

if [[ $VALID_IP ]]; then
    echo -e "LICENSE VALID! Welcome Zohaib."
else
    echo -e "ACCESS DENIED! Aapka IP register nahi hai."
    echo -e "Contact Admin: @zabikhan407"
    exit 1
fi

# 2. System Update & Tools
echo -e "Updating System..."
apt update && apt upgrade -y
apt install jq curl socat xz-utils wget -y

# 3. Xray Core Install
echo -e "Installing Xray Core..."
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

# 4. Folder Creation
mkdir -p /etc/zohaib/
mkdir -p /var/log/xray/

echo "-------------------------------------------"
echo "Setup Mukammal! Xray Install ho gaya hai."
echo "-------------------------------------------"
