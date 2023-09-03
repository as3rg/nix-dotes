#!/usr/bin/env bash

print_values() {
    muted=$(pamixer --get-mute)
    volume=$(pamixer --get-volume)
    printf "$muted\t$volume\n"
}

handle() {
    while read; do 
        print_values
    done
}

print_values
stdbuf -oL pactl subscribe | stdbuf -oL grep "Event 'change' on sink" | handle
