#!/bin/sh
line=$(nmcli -t -f TYPE,STATE,CONNECTION dev 2>/dev/null | awk -F: '$1=="wifi"{print $2"|"$3; exit}')
state=${line%%|*}
name=${line#*|}
if [ "$state" = "connected" ]; then
  printf '%.14s' "$name"
else
  echo off
fi
