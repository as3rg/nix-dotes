#!/bin/sh
if eww active-windows 2>/dev/null | awk '{print $1}' | grep -qx panel; then
  eww close panel
else
  eww open panel
fi
