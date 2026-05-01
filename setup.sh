#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
P='\033[0;35m'
C='\033[0;36m'
G='\033[0;32m'
NC='\033[0m'

MYIP=$(wget -qO- ipv4.icanhazip.com)
REPO_URL="https://raw.githubusercontent.com/zabikhan407/ZOHAIB_VPS_SCRIPT/main"

# 1. License Check
VALID_IP=$(curl -sS ${REPO_URL}/permission.txt | grep -w $MYIP)
if [[ ! $VALID_IP ]]; then echo "ACCESS DENIED!"; exit 1; fi

# 2. Install All Engines
apt-get update && apt-get upgrade -y
apt-get install jq curl socat xz-utils wget net-tools python3 nginx certbot python3-certbot-nginx -y

# 3. Xray Core
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

# 4. Download ALL Components at once
files=("menu.sh" "ssh-menu.sh" "xray-menu.sh" "add-ssh.sh" "add-vless.sh" "check-online.sh")
for file in "${files[@]}"; do
    wget -q -O /usr/bin/${file%.sh} "${REPO_URL}/${file}"
    chmod +x /usr/bin/${file%.sh}
done

# 5. Create Directories
mkdir -p /etc/zohaib/
mkdir -p /var/log/xray/
touch /etc/zohaib/ssh-users.db

clear
echo -e "${P}========================================${NC}"
echo -e "${C}     ZOHAIB_NETWORK SETUP COMPLETE      ${NC}"
echo -e "${P}========================================${NC}"
echo -e "${G}Ab sirf 'menu' likhein.${NC}"
