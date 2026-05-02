#!/bin/bash
# ZOHAIB_NETWORK Professional Master Setup
export DEBIAN_FRONTEND=noninteractive
P='\033[0;35m' ; C='\033[0;36m' ; G='\033[0;32m' ; NC='\033[0m'
REPO_URL="https://raw.githubusercontent.com/zabikhan407/ZOHAIB_VPS_SCRIPT/main"

# 1. Firewall Guard (SSH Connection na toote)
iptables -I INPUT -p tcp --dport 22 -j ACCEPT
iptables -I INPUT -p tcp --dport 80 -j ACCEPT
iptables -I INPUT -p tcp --dport 443 -j ACCEPT
iptables -I INPUT -p tcp --dport 8880 -j ACCEPT

# 2. Base Tools Installation
apt-get update && apt-get install jq curl socat xz-utils wget net-tools python3 nginx screen -y

# 3. Xray Core Installation
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

# 4. Download All Working Components
files=("menu" "ssh-menu" "xray-menu" "add-ssh" "add-vless" "check-online" "list-user" "domain-setup")
for file in "${files[@]}"; do
    wget -q -O /usr/bin/${file} "${REPO_URL}/${file}.sh"
    chmod +x /usr/bin/${file}
done

# 5. SSH WebSocket Engine (Asli Working Tool)
wget -q -O /usr/bin/ws-python "${REPO_URL}/ws-python.py"
chmod +x /usr/bin/ws-python
screen -dmS ws-python python3 /usr/bin/ws-python 8880

# 6. Directories & Banner
mkdir -p /etc/zohaib/
mkdir -p /etc/xray/
echo "ZOHAIB_NETWORK" > /etc/issue.net

clear
echo -e "${P}========================================${NC}"
echo -e "${G}     ZOHAIB_NETWORK SETUP COMPLETE      ${NC}"
echo -e "${P}========================================${NC}"
echo -e "Ab 'menu' likhein. Saare options working hain."
