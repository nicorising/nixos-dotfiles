#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/.local/share/wallpapers"
NUM_WORKSPACES=10

wallpapers=$(find "$WALLPAPER_DIR" | shuf)

if ! pgrep swww-daemon > /dev/null; then
  swww-daemon &
  sleep 2
fi

wallpaper_map_file="$HOME/.cache/hyprland-wallpapers"
mkdir -p "$(dirname "$wallpaper_map_file")"

for i in $(seq 1 $NUM_WORKSPACES); do
  wallpaper_index=$(( (i - 1) % ${#wallpapers[@]} ))
  wallpaper="${wallpapers[$wallpaper_index]}"
  echo "$i:$wallpaper" >> "$wallpaper_map_file"
done

initial_wallpaper="${wallpapers[0]}"
swww img "$initial_wallpaper" -t none

socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | \
while read -r line; do
  case "$line" in
    workspace*)
      workspace=$(echo "$line" | cut -d',' -f2)
      wallpaper=$(grep "^$workspace:" "$wallpaper_map_file" | head -n1 | cut -d':' -f2-)
      if [ -n "$wallpaper" ] && [ -f "$wallpaper" ]; then
        swww img "$wallpaper" --transition-type fade --transition-duration 0.5
      fi
      ;;
  esac
done &

wait
