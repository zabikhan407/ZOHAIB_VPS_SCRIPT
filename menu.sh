# ... (Upar wala pura purple banner code wahi rahega) ...

read -p " Select menu :  " opt
case $opt in
1 | 01) ssh-menu ;;
2 | 02) xray-menu ;;
3 | 03) check-online ;;
x) exit ;;
*) menu ;;
esac
