#!/bin/sh
pamixer -d 5
v=$(pamixer --get-volume)
"$HOME/.config/eww/scripts/osd.sh" "Volume $v%" "$v"
