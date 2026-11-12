#!/bin/sh
pamixer -i 5 --set-limit 200 --allow-boost
v=$(pamixer --get-volume)
"$HOME/.config/eww/scripts/osd.sh" "Volume $v%" "$v"
