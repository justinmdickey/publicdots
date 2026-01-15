#!/bin/bash
#
batt=$(cat /sys/class/power_supply/BAT0/capacity)

if [ $batt -le 20 ]; then
  echo " ${batt}%"
elif [ $batt -le 40 ]; then
  echo " ${batt}%"
elif [ $batt -le 60 ]; then
  echo " ${batt}%"
elif [ $batt -le 80 ]; then
  echo " ${batt}%"
else
  echo "  "
fi
