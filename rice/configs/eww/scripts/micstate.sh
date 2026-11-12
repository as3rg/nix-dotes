#!/bin/sh
c=$(pactl list source-outputs 2>/dev/null | grep -c 'Source Output')
if [ "${c:-0}" -gt 0 ]; then
  printf '\357\204\260'
else
  printf ''
fi
