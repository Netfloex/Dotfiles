#!/bin/bash

UPDATE_COUNT=$(checkupdates | wc -l)
TEXT="Update"
UPDATE="yay -Syu --noconfirm && sleep 5 || read"

if [ $UPDATE_COUNT -eq 0 ]
then
    echo "|iconName=object-select-symbolic"
else
    echo "$UPDATE_COUNT | iconName=software-update-available-symbolic"
fi

echo "---"
echo "$TEXT | bash='kitty sh -c \"${UPDATE}\"' terminal=false iconName=emblem-synchronizing-symbolic"
echo "$TEXT Server | bash='kitty sh -c \"ssh laptop ${UPDATE}\"' terminal=false iconName=emblem-synchronizing-symbolic"
