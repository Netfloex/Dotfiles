
DEVICES=$(
    gdbus call -e \
    -d org.kde.kdeconnect \
    -o /modules/kdeconnect \
    -m org.kde.kdeconnect.daemon.devices
)
# 				Remove these characters  ][)(',
DEVICE_ID=$(echo "$DEVICES" | sed -r "s|[][)(',]||g")


BATTERY=$(
    gdbus call -e \
    -d org.kde.kdeconnect \
    -o /modules/kdeconnect/devices/$DEVICE_ID/battery \
    -m org.freedesktop.DBus.Properties.GetAll \
    org.kde.kdeconnect.device.battery \
    2>&1
)

STATUS=$?
PERCENTAGE=$(echo "$BATTERY" | sed "s|[^0-9]*||g")


if [ $STATUS -eq 1 ] || [ $PERCENTAGE -eq 1 ]
then
    echo " | iconName=battery-missing-symbolic"
    exit
fi

[[ "$BATTERY" == *"false"* ]]
CHARGING=$?

CHARGING_STRING="-"
if [ $CHARGING -eq 1 ]
then
    CHARGING_STRING="-charging-"
fi

ICON_STRING="full"

if (($PERCENTAGE < 15))
then
    ICON_STRING="caution"
elif (($PERCENTAGE < 25))
then
    ICON_STRING="low"
elif (($PERCENTAGE < 60))
then
    ICON_STRING="good"
fi



echo "$PERCENTAGE% | iconName=battery-${ICON_STRING}${CHARGING_STRING}symbolic"