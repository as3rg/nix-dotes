#!/bin/sh
p=$(bluetoothctl show 2>/dev/null | awk '/Powered:/{print $2; exit}')
if [ "$p" = "yes" ]; then
  echo on
else
  echo off
fi
