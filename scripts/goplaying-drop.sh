#!/usr/bin/env bash
# Toggle dropdown terminal for goplaying

# Check if goplaying-drop window exists
if hyprctl clients -j | jq -e '.[] | select(.class=="goplaying-drop")' > /dev/null; then
    # Window exists, toggle the special workspace
    hyprctl dispatch togglespecialworkspace goplaying
else
    # Window doesn't exist, create it - it will go to special workspace automatically
    kitty --class=goplaying-drop -e goplaying &
fi
