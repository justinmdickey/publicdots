#!/bin/bash
# Sync dotfiles from private ~/dots to public ~/publicdots
# This script updates the public repo with changes from private repo

set -e  # Exit on error

PRIVATE_REPO="$HOME/dots"
PUBLIC_REPO="$HOME/publicdots"

echo "=== Syncing dotfiles from private to public repo ==="

# Check repos exist
if [[ ! -d "$PRIVATE_REPO" ]]; then
    echo "Error: Private repo not found at $PRIVATE_REPO"
    exit 1
fi

if [[ ! -d "$PUBLIC_REPO" ]]; then
    echo "Error: Public repo not found at $PUBLIC_REPO"
    exit 1
fi

# Sync .config directories
echo "Syncing .config directories..."
CONFIGS=("fish" "ghostty" "hypr" "nvim" "rofi" "swaync" "tmux" "wal" "waybar")

for config in "${CONFIGS[@]}"; do
    echo "  - Syncing $config..."
    if [[ "$config" == "tmux" ]]; then
        # Special handling for tmux (exclude plugin directories)
        rm -rf "$PUBLIC_REPO/.config/$config"
        cp -r "$PRIVATE_REPO/.config/$config" "$PUBLIC_REPO/.config/"
        rm -rf "$PUBLIC_REPO/.config/tmux/plugins/"*/
    else
        rm -rf "$PUBLIC_REPO/.config/$config"
        cp -r "$PRIVATE_REPO/.config/$config" "$PUBLIC_REPO/.config/"
    fi
done

# Sync scripts
echo "Syncing scripts..."
SCRIPTS=(
    "album_art.sh" "batt.sh" "dark_light_toggle.sh" "gaps.sh"
    "goplaying-drop.sh" "grim.sh" "grimfull.sh" "hostname.sh"
    "hyprland-togglegaps.sh" "hyprportal.sh" "hyprsunset.sh" "hyprwal.sh"
    "lock.sh" "nwg-dock-start.sh" "spotify-notify.py" "swayncreload.sh"
    "tmux_special.sh" "updates.sh" "vol2.sh" "wallpaper.sh"
    "wallselect.sh" "wal.sh" "whatsong.sh" "whoami.sh"
)

mkdir -p "$PUBLIC_REPO/scripts"

for script in "${SCRIPTS[@]}"; do
    if [[ -f "$HOME/Documents/Scripts/$script" ]]; then
        cp "$HOME/Documents/Scripts/$script" "$PUBLIC_REPO/scripts/"
    else
        echo "  Warning: $script not found in ~/Documents/Scripts/"
    fi
done

chmod +x "$PUBLIC_REPO/scripts/"*

# Sanitize paths in scripts
echo "Sanitizing paths in scripts..."
find "$PUBLIC_REPO/scripts" -type f -exec sed -i 's|/home/justin/|$HOME/|g' {} \; 2>/dev/null || true

# Update paths in copied configs
echo "Updating script paths in configs..."
find "$PUBLIC_REPO/.config" -type f \( -name "*.conf" -o -name "*.json" -o -name "config" -o -name "config_bak" \) \
    -exec sed -i 's|~/Documents/Scripts/|~/publicdots/scripts/|g' {} \; 2>/dev/null || true
find "$PUBLIC_REPO/.config" -type f \( -name "*.conf" -o -name "*.json" -o -name "config" -o -name "config_bak" \) \
    -exec sed -i 's|/home/justin/Documents/Scripts/|$HOME/publicdots/scripts/|g' {} \; 2>/dev/null || true

# Update other /home/justin paths in conf files
find "$PUBLIC_REPO/.config" -type f \( -name "*.conf" -o -name "config" -o -name "config_bak" \) \
    -exec sed -i 's|/home/justin/|$HOME/|g' {} \; 2>/dev/null || true

# Update rofi rasi files
find "$PUBLIC_REPO/.config" -type f -name "*.rasi" \
    -exec sed -i 's|/home/justin/|~/|g' {} \; 2>/dev/null || true

echo "=== Sync complete ==="
echo ""
echo "Next steps:"
echo "  1. Review changes: cd $PUBLIC_REPO && git status"
echo "  2. Check for sensitive data: grep -r 'api_key\|token\|password\|secret' $PUBLIC_REPO"
echo "  3. Commit and push: git add -A && git commit -m 'Sync from private repo' && git push"
