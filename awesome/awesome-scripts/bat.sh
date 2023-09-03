#!/usr/bin/env bash
capacity=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)
printf "$capacity\t$status\n"
