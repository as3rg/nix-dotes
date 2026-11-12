#!/bin/sh
# (Re)start the eww UI + notification daemon. Safe to re-run on sway reload.
pkill -f 'eww daemon' 2>/dev/null
pkill -f 'eww/scripts/notifd.py' 2>/dev/null
sleep 0.3

eww daemon
sleep 0.6
eww open bar

notifd >/dev/null 2>&1 &
