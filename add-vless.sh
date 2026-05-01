#!/bin/bash
clear
read -p "Username : " user
read -p "Duration (Days) : " days
read -p "Port (Default 443) : " port
port=${port:-443}
read -p "TLS Enabled? (y/n) : " tls_choice

uuid=$(cat /proc/sys/kernel/random/uuid)
exp=`date -d "$days days" +"%Y-%m-%d"`
domain=$(cat /etc/xray/domain) # Domain setup se ayega

if [[ "$tls_choice" == "y" ]]; then
    link="vless://$uuid@$domain:$port?path=/vless&security=tls&encryption=none&type=ws#$user"
else
    link="vless://$uuid@$domain:$port?path=/vless&security=none&encryption=none&type=ws#$user"
fi

echo -e "VLESS ACCOUNT CREATED\nUser: $user\nUUID: $uuid\nPort: $port\nExp: $exp"
echo -e "Link: $link"
sleep 5 ; xray-menu
