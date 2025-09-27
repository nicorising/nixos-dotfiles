#!/usr/bin/env bash

# Path to wallpapers directory (managed by Home Manager)
WALLPAPER_DIR="$HOME/.local/share/wallpapers"

# Number of workspaces (adjust if you have more/fewer)
NUM_WORKSPACES=10

# Check if wallpaper directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
  echo "Wallpaper directory $WALLPAPER_DIR not found!"
  exit 1
fi

# Get all image files and shuffle them
wallpapers=($(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | shuf))

if [ ${#wallpapers[@]} -eq 0 ]; then
  echo "No wallpapers found in $WALLPAPER_DIR"
  exit 1
fi

# Kill existing hyprpaper instance
pkill hyprpaper 2>/dev/null || true

# Wait a moment for it to fully close
sleep 1

# Create temporary hyprpaper config
config_file="/tmp/hyprpaper.conf"
echo "# Generated hyprpaper config" > "$config_file"

# Preload wallpapers and assign them to workspaces
for i in $(seq 1 $NUM_WORKSPACES); do
  # Use modulo to cycle through wallpapers if we have fewer than workspaces
  wallpaper_index=$(( (i - 1) % ${#wallpapers[@]} ))
  wallpaper="${wallpapers[$wallpaper_index]}"
  
  echo "preload = $wallpaper" >> "$config_file"
done

# Get monitor name(s) - this gets all connected monitors
monitors=($(hyprctl monitors -j | jq -r '.[].name'))

# Set wallpapers for each monitor/workspace combination
for monitor in "${monitors[@]}"; do
  for i in $(seq 1 $NUM_WORKSPACES); do
    wallpaper_index=$(( (i - 1) % ${#wallpapers[@]} ))
    wallpaper="${wallpapers[$wallpaper_index]}"
    echo "wallpaper = $monitor,$wallpaper" >> "$config_file"
  done
done

echo "splash = false" >> "$config_file"

# Start hyprpaper with the generated config
hyprpaper -c "$config_file" &

echo "Wallpapers set successfully!"
