#!/bin/sh
# One-shot workspace state update -> eww vars ws1..ws10 (polled by eww every 1s).
out=$(swaymsg -t get_workspaces 2>/dev/null | jq -r '.[] | "\(.num) \(if .focused then "focused" elif .urgent then "urgent" else "normal" end)"')

i=1
while [ "$i" -le 10 ]; do
  eww update "ws$i=empty"
  i=$((i + 1))
done

echo "$out" | while read -r num state; do
  case "$num" in
    1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10) eww update "ws$num=$state" ;;
  esac
done
