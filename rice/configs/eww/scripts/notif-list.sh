#!/bin/sh
f="${XDG_RUNTIME_DIR:-/tmp}/eww-notif/history.json"
if [ -s "$f" ]; then
  cat "$f"
else
  echo '[]'
fi
