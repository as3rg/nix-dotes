#!/bin/sh
if [ "$(pamixer --get-mute)" = "true" ]; then
  echo muted
else
  echo on
fi
