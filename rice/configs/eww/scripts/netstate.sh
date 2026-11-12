#!/bin/sh
line=$(nmcli -t -f TYPE,STATE,CONNECTION dev 2>/dev/null | awk -F: '$1=="wifi"{print $2"|"$3; exit}')
state=${line%%|*}
name=${line#*|}
if [ "$state" = "connected" ]; then
  printf '\357\207\253  %.16s' "$name"
else
  printf '\357\207\253  off'
fi
