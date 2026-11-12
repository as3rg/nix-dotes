#!/bin/sh
pamixer --default-source -t
if [ "$(pamixer --default-source --get-mute)" = "true" ]; then
  "$HOME/.config/eww/scripts/osd.sh" "Mic muted" 0
else
  "$HOME/.config/eww/scripts/osd.sh" "Mic on" 100
fi
eww poll micmute
