#!/bin/bash
clear
P='\033[0;35m' ; C='\033[0;36m' ; G='\033[0;32m' ; NC='\033[0m'

echo -e "${P}==================================================${NC}"
echo -e "      ${C}ONLINE USERS - ISP & SNI TRACKING${NC}"
echo -e "${P}==================================================${NC}"
echo -e " ${C}DATE:${NC} $(date)"
echo -e "--------------------------------------------------"
echo -e " ${P}USER IP        | NETWORK/ISP         | SNI/HOST${NC}"
echo -e "--------------------------------------------------"

# Xray logs se data nikalna
log_file="/var/log/xray/access.log"
if [ ! -f $log_file ]; then echo "Logs not found!"; sleep 2; menu; fi

# User tracking logic
tail -n 50 $log_file | grep "accepted" | while read -r line; do
    ip=$(echo $line | awk '{print $3}' | cut -d: -f1)
    sni=$(echo $line | awk '{print $5}')
    # ISP detect karne ke liye API call
    isp=$(curl -s http://ip-api.com/json/$ip | jq -r .isp)
    
    printf " %-14s | %-18s | %-15s\n" "$ip" "${isp:0:18}" "${sni:0:15}"
done

echo -e "--------------------------------------------------"
read -p " Press Enter to Back to Menu" ; menu
