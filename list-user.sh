#!/bin/bash
clear
echo "ACTIVE SSH USERS:"
echo "---------------------------"
awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd
echo "---------------------------"
echo "XRAY USERS:"
grep "email" /usr/local/etc/xray/config.json | cut -d\" -f4
echo "---------------------------"
read -p "Press Enter to return" ; menu
