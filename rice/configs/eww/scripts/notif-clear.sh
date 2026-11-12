#!/bin/sh
dir="${XDG_RUNTIME_DIR:-/tmp}/eww-notif"
mkdir -p "$dir"
printf '[]' >"$dir/history.json"
eww poll notif_json
