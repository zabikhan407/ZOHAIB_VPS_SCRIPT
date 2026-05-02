#!/bin/bash
clear
echo "USER TRACKING (ISP & SNI)"
echo "---------------------------------------"
tail -n 20 /var/log/xray/access.log | grep "accepted" | while read -r line; do
    ip=$(echo $line | awk '{print $3}' | cut -d: -f1)
    isp=$(curl -s http://ip-api.com/json/$ip | jq -r .isp)
    echo "IP: $ip | Network: $isp"
done
read -p "Press Enter..." ; menu
