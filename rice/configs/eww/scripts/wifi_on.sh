#!/bin/sh
if [ "$(nmcli radio wifi 2>/dev/null)" = "enabled" ]; then
  echo on
else
  echo off
fi
