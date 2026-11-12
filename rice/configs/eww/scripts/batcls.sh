#!/bin/sh
cap=$(cat /sys/class/power_supply/BAT1/capacity 2>/dev/null || echo 100)
st=$(cat /sys/class/power_supply/BAT1/status 2>/dev/null || echo Unknown)
if [ "$st" = "Charging" ] || [ "$st" = "Full" ]; then
  echo ok
elif [ "$cap" -le 10 ]; then
  echo crit
elif [ "$cap" -le 20 ]; then
  echo warn
else
  echo ok
fi
