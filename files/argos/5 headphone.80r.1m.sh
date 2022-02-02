#!/bin/bash
BATTERY=$(headsetcontrol -bc)

if [ $BATTERY == "-1" ]
then
    TEXT=Charging
elif [ $BATTERY == "-2" ]
then
    echo " "
    exit
else
    TEXT=$BATTERY%
fi

echo "$TEXT | iconName=audio-headset-symbolic"