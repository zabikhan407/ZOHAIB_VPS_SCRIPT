#!/bin/bash
clear
read -p "User: " user
read -p "Days: " days
uuid=$(cat /proc/sys/kernel/random/uuid)
IP=$(curl -s ipinfo.io/ip)
echo -e "VLESS ACCOUNT\nUUID: $uuid\nPort: 80\nPath: /vless"
echo -e "Link: vless://$uuid@$IP:80?path=/vless&security=none&encryption=none&type=ws#$user"
read -p "Press Enter..." ; menu
