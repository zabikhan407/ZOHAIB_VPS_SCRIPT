#!/bin/bash
clear
read -p "Username : " user
read -p "Password : " pass
read -p "Limit IP Login : " iplimit
read -p "Duration (Days) : " days

exp=`date -d "$days days" +"%Y-%m-%d"`
useradd -e $exp -M -s /bin/false $user
echo "$user:$pass" | chpasswd

# IP Limit Store karna
echo "$user $iplimit" >> /etc/zohaib/limit-ssh.db

echo -e "SSH WS Created!\nHost: $(curl -s ipinfo.io/ip)\nUser: $user\nPass: $pass\nIP Limit: $iplimit"
sleep 5 ; ssh-menu
