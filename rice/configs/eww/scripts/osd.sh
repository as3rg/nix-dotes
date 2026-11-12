#!/bin/sh
# usage: osd.sh "<label>" <value 0-100>
eww update "osd_label=$1"
eww update "osd_value=$2"
eww open osd
(
  sleep 1.6
  eww close osd
) >/dev/null 2>&1 &
