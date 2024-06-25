#!/usr/bin/env bash

handle() {
    while read line; do
        if [[ $line =~ ^\s*uint32\ (.*)$ ]]; then
            status=${BASH_REMATCH[1]}        
            wifi=$(nmcli -t -f active,ssid dev wifi | grep -E '^yes' | sed 's/^yes://g')
            if [ status == "20" ] and [ $(nmcli radio wifi) != "enabled" ]; then
                status="10"
            fi
            printf "$status\t$wifi\n"
        fi
    done
}
dbus-send --system --print-reply --reply-timeout=120000 --type=method_call --dest='org.freedesktop.NetworkManager' '/org/freedesktop/NetworkManager' org.freedesktop.NetworkManager.state | handle
dbus-monitor --system "sender=org.freedesktop.NetworkManager, path=/org/freedesktop/NetworkManager, member=StateChanged" | handle
