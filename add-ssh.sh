#!/bin/bash
clear
read -p "Username : " user
read -p "Password : " pass
read -p "Days     : " days
exp=`date -d "$days days" +"%d %b %Y"`
useradd -e `date -d "$days days" +"%Y-%m-%d"` -M -s /bin/false $user
echo "$user:$pass" | chpasswd
IP=$(curl -s ipinfo.io/ip)
echo -e "┌──────────────────────────────────────┐"
echo -e "│       SSH WS ACCOUNT CREATED         │"
echo -e "├──────────────────────────────────────┤"
echo -e " User: $user | Pass: $pass"
echo -e " Host: $IP | Port: 80, 8880"
echo -e " Expire: $exp"
echo -e " Payload: GET /ssh HTTP/1.1[crlf]Host: [host][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "└──────────────────────────────────────┘"
read -p "Press Enter..." ; menu
