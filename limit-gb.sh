#!/bin/bash
# Data & IP Limit Logic
# Ye script check karta hai ke user kitna data use kar chuka hai

clear
echo "GB & IP LIMIT SETTINGS"
echo "--------------------------------"
echo "1. Set GB Limit per User"
echo "2. Set IP Login Limit"
echo "3. View Current Usage"
echo "x. Back"
read -p "Option: " opt

case $opt in
1) read -p "Enter Limit (GB): " gblimit ; echo $gblimit > /etc/zohaib/gb_limit.db ;;
2) read -p "Enter IP Limit: " iplimit ; echo $iplimit > /etc/zohaib/ip_limit.db ;;
3) echo "Feature in progress with Xray API..." ;;
x) menu ;;
esac
