
DEVICE_ID=$(~/.local/share/gnome-shell/extensions/gsconnect@andyholmes.github.io/service/daemon.js -l)

BATTERY=$(
    gdbus call -e \
    -d org.gnome.Shell.Extensions.GSConnect \
    -o /org/gnome/Shell/Extensions/GSConnect/Device/$DEVICE_ID \
    -m org.gtk.Actions.Describe battery \
    2>&1
)
STATUS=$?
PERCENTAGE=$(echo "$BATTERY" | cut -d"," -f5)
ICON=$(echo "$BATTERY" | cut -d"'" -f4)

if [ $STATUS -eq 1 ]
then
    echo "| iconName=battery-missing-symbolic"
    exit
fi


echo "$PERCENTAGE% | iconName=${ICON}"