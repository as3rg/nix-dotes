#!/bin/sh
p=$(bluetoothctl show 2>/dev/null | awk '/Powered:/{print $2; exit}')
if [ "$p" = "yes" ]; then
  printf '\357\212\223  on'
else
  printf '\357\212\223  off'
fi
