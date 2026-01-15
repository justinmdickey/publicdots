#!/bin/bash

# Directory with wallpapers - using the same name as in wal.sh
DIR="$HOME/Pictures/light/"
SYMLINK="$HOME/Pictures/wal.png"

# Create a list of wallpapers with the original images as icons
create_wallpaper_list() {
  find "$DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | while read -r img; do
    # Use the image itself as its own icon
    echo -e "$img\0icon\x1f$img"
  done
}

# Select wallpaper with Rofi
selected=$(create_wallpaper_list | rofi -dmenu -i -p "Select Wallpaper" -show-icons -theme ~/.config/rofi/launchers/wal/WallSelect.rasi)

# If a wallpaper was selected, apply it
if [ -n "$selected" ]; then
  # Save the selection for persistence across reboots
  echo "$selected" >~/.current_wallpaper

  # Remove old symlink if it exists and create a new one
  if [ -L "$SYMLINK" ] || [ -e "$SYMLINK" ]; then
    rm "$SYMLINK"
  fi
  ln -s "$selected" "$SYMLINK"

  # Check if running GNOME
  if pgrep -x "gnome-shell" >/dev/null; then
    # Set wallpaper the GNOME way
    gsettings set org.gnome.desktop.background picture-uri "file://$selected"
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$selected"
  else
    # Apply the wallpaper using swww with your custom transitions
    swww img "$selected" --transition-type wipe --transition-step 255 --transition-fps 60 --transition-bezier 0.68,0.6,0.32,1.3 --transition-duration 0.8
  fi

  # Hyprland notification
  notify-send.sh -a "Wallpaper Manager" -i "$selected" "Wallpaper Updated" -r 9993

fi
