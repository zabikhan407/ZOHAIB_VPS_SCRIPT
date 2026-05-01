#!/bin/bash
clear
echo "ONLINE USERS & ISP TRACKING"
echo "-----------------------------------"
# Xray logs se data nikalna
data=$(tail -n 100 /var/log/xray/access.log | grep "accepted")
while read -r line; do
    client_ip=$(echo $line | awk '{print $3}' | cut -d: -f1)
    isp=$(curl -s http://ip-api.com/json/$client_ip | jq -r .isp)
    echo "User IP: $client_ip | Network: $isp"
done <<< "$data"
read -p "Press Enter to return..." ; menu
