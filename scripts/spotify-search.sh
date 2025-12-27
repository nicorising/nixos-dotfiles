#!/usr/bin/env bash

query=$(echo "" | fuzzel --dmenu 2>/dev/null)

if [ -z "$query" ]; then
    exit 0
fi

results=$(spt search "$query" --tracks --format "%t|%a|%u" 2>/dev/null | head -20)

if [ -z "$results" ]; then
    notify-send "Spotify" "No results found"
    exit 0
fi

menu=$(echo "$results" | awk -F'|' '{print $1 " - " $2 "|" $3}')

chosen=$(echo "$menu" | cut -d'|' -f1 | fuzzel --dmenu 2>/dev/null)

if [ -z "$chosen" ]; then
    exit 0
fi

uri=$(echo "$menu" | grep "^$chosen|" | cut -d'|' -f2)

spt play --uri "$uri"
notify-send "Spotify" "Playing: $chosen"
