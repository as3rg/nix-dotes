#!/usr/bin/env bash
BAT="/sys/class/power_supply/BAT0"
if [ -d $BAT ]; then
    capacity=$(cat $BAT/capacity)
    status=$(cat $BAT/status)
    printf "$capacity\t$status\n"
else
    printf "100\tNone\n"
fi
