#!/bin/sh
if eww active-windows 2>/dev/null | awk '{print $1}' | grep -qx desktop; then
  eww close desktop
else
  eww open desktop
fi
