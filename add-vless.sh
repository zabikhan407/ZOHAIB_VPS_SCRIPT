#!/bin/bash
clear
read -p "Username : " user
read -p "Days : " days
uuid=$(cat /proc/sys/kernel/random/uuid)
exp=`date -d "$days days" +"%Y-%m-%d"`
domain=$(curl -s ipinfo.io/ip)
echo -e "VLESS Created!\nUUID: $uuid\nExp: $exp"
echo -e "Link: vless://$uuid@$domain:443?path=/vless&security=none&encryption=none&type=ws#$user"
sleep 5
xray-menu
