#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
REPO_URL="https://raw.githubusercontent.com/zabikhan407/ZOHAIB_VPS_SCRIPT/main"

# 1. Ports Open
iptables -I INPUT -p tcp --dport 80 -j ACCEPT
iptables -I INPUT -p tcp --dport 443 -j ACCEPT
iptables -I INPUT -p tcp --dport 8880 -j ACCEPT

# 2. Base Engines
apt-get update && apt-get install jq curl socat wget net-tools nginx python3 screen -y

# 3. Xray Config (The Brain)
mkdir -p /usr/local/etc/xray/
cat <<EOF > /usr/local/etc/xray/config.json
{
  "log": { "access": "/var/log/xray/access.log", "loglevel": "info" },
  "inbounds": [{
    "port": 10001, "listen": "127.0.0.1", "protocol": "vless",
    "settings": { "clients": [], "decryption": "none" },
    "streamSettings": { "network": "ws", "wsSettings": { "path": "/vless" } }
  }],
  "outbounds": [{ "protocol": "freedom" }]
}
EOF
systemctl restart xray

# 4. Nginx "409 Conflict" Fix Config
cat <<EOF > /etc/nginx/sites-available/default
server {
    listen 80;
    location /vless {
        proxy_redirect off;
        proxy_pass http://127.0.0.1:10001;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host \$http_host;
    }
}
EOF
systemctl restart nginx

# 5. Download Modules
files=("menu" "ssh-menu" "xray-menu" "add-ssh" "add-vless" "check-online" "domain-setup")
for file in "${files[@]}"; do
    wget -q -O /usr/bin/${file} "${REPO_URL}/${file}.sh"
    chmod +x /usr/bin/${file}
done

# 6. SSH WS Engine (Python 3)
wget -q -O /usr/bin/ws-python "${REPO_URL}/ws-python.py"
chmod +x /usr/bin/ws-python
screen -dmS ws-python python3 /usr/bin/ws-python 8880

clear
echo "SETUP COMPLETE! Ab 'menu' likhein."
