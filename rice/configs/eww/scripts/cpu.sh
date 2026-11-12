#!/bin/sh
# CPU usage from /proc/stat deltas, one sample every 2s.
prev_idle=0
prev_total=0
while :; do
  set -- $(awk '/^cpu /{print $2, $3, $4, $5, $6, $7, $8}' /proc/stat)
  idle=$(($4 + $5))
  total=$(($1 + $2 + $3 + $4 + $5 + $6 + $7))
  if [ "$prev_total" -ne 0 ]; then
    dt=$((total - prev_total))
    di=$((idle - prev_idle))
    if [ "$dt" -gt 0 ]; then
      echo $(((100 * (dt - di)) / dt))
    fi
  fi
  prev_total=$total
  prev_idle=$idle
  sleep 2
done
