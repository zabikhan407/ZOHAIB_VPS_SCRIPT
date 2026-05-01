#!/bin/bash
# ZOHAIB_NETWORK Master Setup
export DEBIAN_FRONTEND=noninteractive
P='\033[0;35m' ; C='\033[0;36m' ; G='\033[0;32m' ; NC='\033[0m'

MYIP=$(wget -qO- ipv4.icanhazip.com)
REPO_URL="https://raw.githubusercontent.com/zabikhan407/ZOHAIB_VPS_SCRIPT/main"

# 1. License Check
VALID_IP=$(curl -sS ${REPO_URL}/permission.txt | grep -w $MYIP)
if [[ ! $VALID_IP ]]; then echo "ACCESS DENIED!"; exit 1; fi

# 2. Base Installation
apt-get update && apt-get upgrade -y
apt-get install jq curl socat xz-utils wget net-tools python3 nginx certbot python3-certbot-nginx -y

# 3. Xray Installation
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

# 4. SSH Banner Setup
echo "Welcome to ZOHAIB_NETWORK" > /etc/issue.net
sed -i 's/#Banner none/Banner \/etc\/issue.net/g' /etc/ssh/sshd_config
systemctl restart ssh

# 5. Download All Professional Components
files=("menu.sh" "ssh-menu.sh" "xray-menu.sh" "add-ssh.sh" "add-vless.sh" "check-online.sh" "domain-setup.sh" "limit-ip.sh")
for file in "${files[@]}"; do
    wget -q -O /usr/bin/${file%.sh} "${REPO_URL}/${file}"
    chmod +x /usr/bin/${file%.sh}
done

# 6. Cron Job for IP & GB Limit (Background task)
(crontab -l ; echo "*/5 * * * * /usr/bin/limit-ip") | crontab -

clear
echo -e "${G}INSTALLATION MUKAMMAL! Ab 'menu' likhein.${NC}"
