#!/bin/sh
cap=$(cat /sys/class/power_supply/BAT1/capacity 2>/dev/null || echo 0)
st=$(cat /sys/class/power_supply/BAT1/status 2>/dev/null || echo Unknown)
if [ "$st" = "Charging" ]; then
  printf '\357\211\200  %s%% \357\203\247' "$cap"
else
  printf '\357\211\200  %s%%' "$cap"
fi
