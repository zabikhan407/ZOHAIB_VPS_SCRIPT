#!/bin/bash
clear
# ... (Banner aur Input wahi rahega) ...
# Link generate karne ke baad ye add karein:
echo -e "${G}Link TLS :${NC} vless://$uuid@$domain:443?path=/vless&security=tls&encryption=none&type=ws#$user"
echo -e "${G}Link NTLS:${NC} vless://$uuid@$domain:80?path=/vless&security=none&encryption=none&type=ws#$user"
echo -e "----------------------------------------------"
echo -e "${YL}Copy kar lein. Wapis janay ke liye Enter dabayein...${NC}"
read # Ye line screen ko rok kar rakhegi
xray-menu
