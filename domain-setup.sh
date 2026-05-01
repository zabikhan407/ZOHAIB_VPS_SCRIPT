#!/bin/bash
clear
echo -e "DOMAIN & SSL AUTO-CONFIG"
read -p "Apna Pointed Domain Likhein: " domain
echo "$domain" > /etc/xray/domain

# SSL Certificate install karna
systemctl stop nginx
certbot certonly --standalone --preferred-challenges http -d $domain --register-unsafely-without-email --agree-tos
systemctl start nginx

# Xray and Nginx Linking
echo "SSL installed successfully on $domain"
sleep 3 ; menu
