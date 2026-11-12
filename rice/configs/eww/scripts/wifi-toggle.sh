#!/bin/sh
nmcli radio wifi toggle
sleep 0.8
eww poll wifi_on
eww poll wifi_ssid
eww poll net
