ACTIVATED=$(nmcli -f GENERAL.STATE c show peer_computer)

if [ ! -z "$ACTIVATED" ]
then
    echo "| iconName=network-vpn-symbolic"
    echo ---
    echo "Turn off vpn | bash='nmcli c down peer_computer' terminal=false"
else
    echo "| iconName=network-vpn-acquiring-symbolic"
    echo ---
    echo "Turn on vpn | bash='nmcli c up peer_computer' terminal=false"
fi
