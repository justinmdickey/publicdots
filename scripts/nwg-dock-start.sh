#!/usr/bin/env bash

# Start nwg-dock-hyprland with SCSS compilation
# This script compiles the SCSS, then kills and restarts nwg-dock-hyprland

DIR="$HOME/.config/nwg-dock-hyprland"
SCSS_FILE="$DIR/style.scss"
CSS_FILE="$DIR/style.css"

# Compile SCSS to CSS if a compiler is available and SCSS file exists
if [ -f "$SCSS_FILE" ]; then
    if command -v sass &> /dev/null; then
        sass --no-source-map "$SCSS_FILE" "$CSS_FILE" 2>&1
    elif command -v sassc &> /dev/null; then
        sassc "$SCSS_FILE" "$CSS_FILE" 2>&1
    fi
fi

# Kill any running instances
killall nwg-dock-hyprland 2>/dev/null
sleep 0.1

# Start nwg-dock-hyprland in background with nohup
# -mb 8 adds 8px bottom margin so dock isn't touching the screen edge
# -nolauncher removes the app launcher button
nohup nwg-dock-hyprland -d > /dev/null 2>&1 &
