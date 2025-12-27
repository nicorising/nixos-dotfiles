#!/usr/bin/env bash

paired=$(bluetoothctl devices Paired | cut -d ' ' -f 2-)

if [ -z "$paired" ]; then
    notify-send "Bluetooth" "No paired devices"
    exit 0
fi

menu=""
while IFS= read -r line; do
    mac=$(echo "$line" | cut -d ' ' -f 1)
    name=$(echo "$line" | cut -d ' ' -f 2-)
    
    if bluetoothctl info "$mac" | grep -q "Connected: yes"; then
        menu+="󰂱  $name (connected)\n"
    else
        menu+="󰂯  $name\n"
    fi
done <<< "$paired"

chosen=$(echo -e "$menu" | wofi --dmenu --prompt "Bluetooth" --width 300 --height 200)

if [ -z "$chosen" ]; then
    exit 0
fi

name=$(echo "$chosen" | sed 's/^�[±-]  //' | sed 's/ (connected)$//')
mac=$(bluetoothctl devices Paired | grep "$name" | cut -d ' ' -f 2)

if echo "$chosen" | grep -q "(connected)"; then
    bluetoothctl disconnect "$mac"
    notify-send "Bluetooth" "Disconnected from $name"
else
    bluetoothctl connect "$mac"
    notify-send "Bluetooth" "Connecting to $name..."
fi
