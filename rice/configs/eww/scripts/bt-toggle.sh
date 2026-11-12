#!/bin/sh
if bluetoothctl show 2>/dev/null | grep -q 'Powered: yes'; then
  bluetoothctl power off
else
  bluetoothctl power on
fi
sleep 1
eww poll bt_on
eww poll bt
