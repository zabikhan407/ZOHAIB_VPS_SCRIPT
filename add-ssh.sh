#!/bin/bash
clear
read -p "Username : " user
read -p "Password : " pass
read -p "Days     : " days

exp=`date -d "$days days" +"%Y-%m-%d"`
useradd -e $exp -M -s /bin/false $user
echo "$user:$pass" | chpasswd

host=$(curl -s ipinfo.io/ip)
echo -e "SSH Account Created!"
echo -e "Host: $host\nPort: 80, 8880 (WS)\nUser: $user\nPass: $pass\nExp: $exp"
