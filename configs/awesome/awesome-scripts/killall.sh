#!/usr/bin/env bash
current=$$
for line in $(pgrep -f "awesome-scripts"); do
    if [[ "$line" != "$current" ]]; then
        kill -- -$line
    fi
done
