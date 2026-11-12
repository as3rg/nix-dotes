#!/bin/sh
if [ "$(pamixer --default-source --get-mute)" = "true" ]; then
  echo muted
else
  echo on
fi
