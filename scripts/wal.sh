#!/bin/bash

DIR="$HOME/Pictures/light/"

BG=$(find "$DIR" -type f -iname "*.png" -o -iname "*.jpg" -o -iname "*.gif" | shuf -n 1)

# Remove old symlink if it exists and create a new one
if [ -L "$HOME/Pictures/wal.png" ] || [ -e "$HOME/Pictures/wal.png" ]; then
  rm "$HOME/Pictures/wal.png"
fi
ln -s "$BG" "$HOME/Pictures/wal.png"

# Check if running GNOME
if pgrep -x "gnome-shell" >/dev/null; then
  # Set wallpaper the GNOME way
  gsettings set org.gnome.desktop.background picture-uri "file://$BG"
  gsettings set org.gnome.desktop.background picture-uri-dark "file://$BG"

  # GNOME notification - using notify-send directly is more reliable in GNOME
  # notify-send -a "Wallpaper Manager" "Wallpaper Updated" -i "$BG" -r 9993 -a "Wallpaper Manager"
else
  # Original Hyprland method with swww
  swww img "$BG" --transition-type wipe --transition-step 255 --transition-fps 60 --transition-bezier 0.68,0.6,0.32,1.3 --transition-duration 0.8

  # Hyprland notification
  notify-send.sh -a "Wallpaper Manager" -i "$BG" "Wallpaper Updated" -r 9993
fi
