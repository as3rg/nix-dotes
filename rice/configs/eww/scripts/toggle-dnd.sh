#!/bin/sh
flag="${XDG_RUNTIME_DIR:-/tmp}/eww-notif-dnd"
if [ -e "$flag" ]; then
  rm -f "$flag"
  eww update dnd=off
else
  : >"$flag"
  eww update dnd=on
fi
