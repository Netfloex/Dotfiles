#/bin/bash

BATTERY="$(cat /sys/class/power_supply/hidpp_battery_0/capacity 2> /dev/null)"

# If battery information is available
if [ $? -eq 0 ]
then
    echo $BATTERY > ~/.cache/mouseBattery
    # Cache it
else
    # If it's not available, retrieve from cache
    # This is needed because when Argo launches, the battery information is not available
    # Since the battery does not change quickly, we only need to update it every hour
    # Without the cache would it be empty for the first hour
    
    BATTERY="$(cat ~/.cache/mouseBattery 2> /dev/null)"
    
    if [ $? -eq 1 ]
    then
        # If Cache is not available, don't show the widget
        echo " "
        exit
    fi
fi

echo "$BATTERY% | iconName=input-mouse-symbolic"