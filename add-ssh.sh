#!/bin/bash
clear
read -p "Username : " user
read -p "Password : " pass
read -p "Duration (Days) : " days
exp=`date -d "$days days" +"%Y-%m-%d"`
useradd -e $exp -M -s /bin/false $user
echo "$user:$pass" | chpasswd
echo "SSH Account $user Created! Expires: $exp"
sleep 3
ssh-menu
