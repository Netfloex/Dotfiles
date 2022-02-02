#/bin/bash

BATTERY="$(cat /sys/class/power_supply/hidpp_battery_0/capacity)"
echo "$BATTERY% | iconName=input-mouse-symbolic"