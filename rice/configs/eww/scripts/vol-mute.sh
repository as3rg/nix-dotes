#!/bin/sh
pamixer --toggle-mute
if [ "$(pamixer --get-mute)" = "true" ]; then
  st="muted"
else
  st="on"
fi
v=$(pamixer --get-volume)
"$HOME/.config/eww/scripts/osd.sh" "Volume $st ($v%)" "$v"
eww poll volume
eww poll volmute
