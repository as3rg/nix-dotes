#!/bin/sh
for f in /dev/video*; do
  [ -e "$f" ] || continue
  if fuser "$f" >/dev/null 2>&1; then
    printf '\357\200\275'
    exit 0
  fi
done
printf ''
