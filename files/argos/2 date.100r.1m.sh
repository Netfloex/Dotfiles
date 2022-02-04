#!/bin/bash

DUTCH_WEEKDAYS=(Maandag Dinsdag Woensdag Donderdag Vrijdag Zaterdag Zondag)
DUTCH_MONTHS=(Januari Februari Maart April Mei Juni Juli Augustus September October November December)


WEEKDAY=${DUTCH_WEEKDAYS[$(date +"%u") -1 ]}
DATE=$(date +"%-d")
MONTH=${DUTCH_MONTHS[$(date +"%-m") -1 ]}

echo "$WEEKDAY $DATE $MONTH"