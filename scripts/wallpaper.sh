#!/bin/bash

# Unified wallpaper management script
# Usage:
#   wallpaper.sh -r|--random   : Set random wallpaper from current directory
#   wallpaper.sh -p|--pick     : Pick wallpaper with rofi
#   wallpaper.sh -d|--dir      : Change wallpaper directory

CONFIG_FILE="$HOME/.config/wallpaper-dir"
SYMLINK="$HOME/Pictures/wal.png"

# Create config file with default directory if it doesn't exist
if [ ! -f "$CONFIG_FILE" ]; then
    mkdir -p "$(dirname "$CONFIG_FILE")"
    echo "$HOME/Pictures/light/" > "$CONFIG_FILE"
fi

# Read current directory from config
DIR=$(cat "$CONFIG_FILE")

# Function to set wallpaper
set_wallpaper() {
    local selected="$1"
    
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
        
        # GNOME notification
        # notify-send -a "Wallpaper Manager" "Wallpaper Updated" -i "$selected" -r 9993
    else
        # Hyprland method with swww
        swww img "$selected" --transition-type wipe --transition-step 255 --transition-fps 60 --transition-bezier 0.68,0.6,0.32,1.3 --transition-duration 0.8
        
        # Hyprland notification
        notify-send.sh -a "Wallpaper Manager" -i "$selected" "Wallpaper Updated" -r 9993
    fi
}

# Function to pick random wallpaper
random_wallpaper() {
    BG=$(find "$DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.gif" \) | shuf -n 1)
    
    if [ -n "$BG" ]; then
        set_wallpaper "$BG"
    else
        notify-send.sh -a "Wallpaper Manager" "Error: No wallpapers found in $DIR" -r 9993
    fi
}

# Function to pick wallpaper with rofi
pick_wallpaper() {
    # Create a list of wallpapers with the original images as icons
    create_wallpaper_list() {
        find "$DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.gif" \) | while read -r img; do
            # Use the image itself as its own icon
            echo -e "$img\0icon\x1f$img"
        done
    }
    
    # Select wallpaper with Rofi
    selected=$(create_wallpaper_list | rofi -dmenu -i -p "Select Wallpaper" -show-icons -theme ~/.config/rofi/launchers/wal/WallSelect.rasi)
    
    # If a wallpaper was selected, apply it
    if [ -n "$selected" ]; then
        # Save the selection for persistence across reboots
        echo "$selected" > ~/.current_wallpaper
        set_wallpaper "$selected"
    fi
}

# Function to change wallpaper directory
change_directory() {
    # Create a temporary file to store the selected directory
    temp_file=$(mktemp)
    
    # Launch kitty in floating mode with fzf to select directory
    kitty --class="floating_kitty" --title="Wallpaper Directory Picker" sh -c "
        find ~/Pictures -maxdepth 1 -type d | sort | \
        fzf --prompt='Select Wallpaper Directory: ' \
            --height=40% \
            --border > '$temp_file'
    "
    
    # Read the selected directory from temp file
    selected_dir=$(cat "$temp_file")
    rm "$temp_file"
    
    if [ -n "$selected_dir" ]; then
        # Ensure directory ends with /
        [[ "$selected_dir" != */ ]] && selected_dir="$selected_dir/"
        
        # Save to config file
        echo "$selected_dir" > "$CONFIG_FILE"
        
        notify-send.sh -a "Wallpaper Manager" "Directory changed to: $selected_dir" -r 9993
    fi
}

# Parse command line arguments
case "$1" in
    -r|--random)
        random_wallpaper
        ;;
    -p|--pick)
        pick_wallpaper
        ;;
    -d|--dir)
        change_directory
        ;;
    *)
        echo "Usage: $0 {-r|--random|-p|--pick|-d|--dir}"
        echo "  -r, --random  : Set random wallpaper from current directory"
        echo "  -p, --pick    : Pick wallpaper with rofi"
        echo "  -d, --dir     : Change wallpaper directory"
        exit 1
        ;;
esac
