#!/bin/bash
# ZOHAIB_NETWORK Professional Safe Installer
export DEBIAN_FRONTEND=noninteractive
P='\033[0;35m' ; C='\033[0;36m' ; G='\033[0;32m' ; NC='\033[0m'
REPO_URL="https://raw.githubusercontent.com/zabikhan407/ZOHAIB_VPS_SCRIPT/main"

# 1. SSH Guard & Firewall (Oracle Fix)
echo -e "${C}Setting up Firewall Guard...${NC}"
iptables -I INPUT -p tcp --dport 22 -j ACCEPT
iptables -I INPUT -p tcp --dport 80 -j ACCEPT
iptables -I INPUT -p tcp --dport 443 -j ACCEPT
iptables -I INPUT -p tcp --dport 8880 -j ACCEPT
apt-get purge ufw -y # UFW nikal dete hain taake block na ho

# 2. System Tools
echo -e "${C}Installing Professional Tools...${NC}"
apt-get update && apt-get install jq curl socat wget net-tools nginx certbot python3 -y

# 3. Xray Core
echo -e "${C}Installing Xray Engine...${NC}"
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

# 4. Download All Modular Files (Commands)
files=("menu" "ssh-menu" "xray-menu" "add-ssh" "add-vless" "check-online" "domain-setup" "limit-gb")
for file in "${files[@]}"; do
    wget -q -O /usr/bin/${file} "${REPO_URL}/${file}.sh"
    chmod +x /usr/bin/${file}
done

mkdir -p /etc/xray/
mkdir -p /etc/zohaib/
echo "ZOHAIB_NETWORK" > /etc/issue.net

clear
echo -e "${P}==================================================${NC}"
echo -e " ${G}ZOHAIB_NETWORK INSTALLATION MUKAMMAL!${NC}"
echo -e " ${C}VPS block nahi hoga. Ab 'menu' likhein.${NC}"
echo -e "${P}==================================================${NC}"
