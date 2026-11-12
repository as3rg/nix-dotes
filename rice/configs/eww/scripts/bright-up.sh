#!/bin/sh
brightnessctl set +5%
p=$(brightnessctl -m | cut -d, -f4)
"$HOME/.config/eww/scripts/osd.sh" "Brightness $p" "$(echo "$p" | tr -d '%')"
