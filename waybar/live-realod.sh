#!/bin/bash

# Directory to watch (edit this path if needed)
WATCH_DIR="$HOME/.config/waybar"

# Check if inotifywait is installed
if ! command -v inotifywait >/dev/null 2>&1; then
  echo "Error: inotifywait is not installed. Install it with 'sudo apt install inotify-tools' or equivalent."
  exit 1
fi

echo "Watching directory: $WATCH_DIR for changes..."

# Infinite loop to watch for changes
while true; do
  inotifywait -e modify,close_write,create,delete,move "$WATCH_DIR" >/dev/null 2>&1

  echo "Change detected. Restarting waybar..."
  pkill waybar
  waybar &
done
