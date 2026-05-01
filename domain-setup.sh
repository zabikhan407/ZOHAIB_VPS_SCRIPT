#!/bin/bash
clear
read -p "Apna Domain Likhein (e.g. zohaib.com): " domain
echo "$domain" > /etc/xray/domain

# SSL Certificate hasil karna
certbot certonly --standalone --preferred-challenges http -d $domain --register-unsafely-without-email --agree-tos

# Nginx config generate karna
cat <<EOF > /etc/nginx/sites-available/xray
server {
    listen 80;
    server_name $domain;
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
ln -s /etc/nginx/sites-available/xray /etc/nginx/sites-enabled/
systemctl restart nginx
echo "Domain Setup & SSL Mukammal!"
sleep 3 ; menu
