# publicdots

My public Hyprland dotfiles configuration.

![Screenshot](images/screenshot.png)

## Overview

This repository contains my Wayland/Hyprland desktop configuration including:

- **Compositor**: Hyprland with custom bindings and workspace management
- **Terminal**: Ghostty with custom theming
- **Editor**: Neovim with modern plugin setup
- **Launcher**: Rofi with custom applets
- **Notifications**: SwayNC with custom styling
- **Multiplexer**: Tmux with fuzzy session switching
- **Status bar**: Waybar with custom modules
- **Theming**: Pywal integration

## Included Configurations

### Config Directories (.config/)
- `ghostty/` - Terminal emulator configuration
- `hypr/` - Hyprland compositor settings, keybinds, startup apps
- `nvim/` - Neovim with lazy.nvim plugin manager
- `rofi/` - Application launcher with custom applets
- `swaync/` - Notification daemon styling
- `tmux/` - Terminal multiplexer with plugins
- `wal/` - Pywal color scheme hooks
- `waybar/` - Status bar configuration

### Scripts (scripts/)
24 utility scripts for system management:
- Wallpaper management: `wallpaper.sh`, `wal.sh`
- Screen locking: `lock.sh`
- Theme switching: `dark_light_toggle.sh`
- Media controls: `goplaying-drop.sh`, `spotify-notify.py`, `whatsong.sh`
- System monitoring: `updates.sh`, `whoami.sh`, `batt.sh`
- Screenshots: `grim.sh`, `grimfull.sh`
- Volume control: `vol2.sh`
- And more...

## Installation

### Quick Install

```bash
# Clone the repository
git clone https://github.com/justinmdickey/publicdots.git ~/publicdots

# Option 1: Symlink configs (recommended for easy updates)
ln -sf ~/publicdots/.config/hypr ~/.config/hypr
ln -sf ~/publicdots/.config/waybar ~/.config/waybar
# ... repeat for other configs you want

# Option 2: Copy configs (if you want to modify without tracking)
cp -r ~/publicdots/.config/hypr ~/.config/
cp -r ~/publicdots/.config/waybar ~/.config/
# ... repeat for other configs
```

### Scripts Installation

The configurations expect scripts to be in `~/publicdots/scripts/`. You have several options:

**Option A: Use as-is (recommended)**
```bash
# Configs already point to ~/publicdots/scripts/
# Just make sure the repo is cloned to ~/publicdots
```

**Option B: Symlink to different location**
```bash
# If you prefer scripts in ~/.local/bin/
ln -sf ~/publicdots/scripts ~/.local/bin/dotscripts
# Then update paths in configs manually
```

**Option C: Copy scripts**
```bash
# Copy to your preferred script location
cp ~/publicdots/scripts/* ~/Documents/Scripts/
# Then update paths in configs using find/replace:
# ~/publicdots/scripts/ -> ~/Documents/Scripts/
```

### Dependencies

Core requirements:
- Hyprland (compositor)
- Waybar (status bar)
- Rofi (launcher)
- SwayNC (notifications)
- Ghostty (terminal)
- Neovim (editor)
- Tmux (multiplexer)
- Pywal (theming - optional)

Additional utilities referenced by scripts:
- grim, slurp (screenshots)
- pamixer, wireplumber (audio)
- brightnessctl (backlight)
- playerctl (media controls)
- swww (wallpaper)
- sassc (SCSS compilation for swaync)
- Various other system utilities

## Customization

### Adjusting Paths

If you clone to a different location, update script paths:

```bash
# Update all config files to point to your script location
cd ~/publicdots/.config
find . -type f -exec sed -i 's|~/publicdots/scripts/|/your/path/|g' {} \;
```

### Note on Hardcoded Paths

Some SCSS/CSS files contain hardcoded paths to `~/.cache/wal/` for Pywal color imports. These cannot use shell variables. Options:
1. Run `pywal` which regenerates these files with correct paths
2. Manually update the paths in `.scss` and `.css` files
3. Use a sed command: `find . -name "*.scss" -exec sed -i 's|/home/justin|/home/yourusername|g' {} \;`

### Theming

Colors are managed by Pywal. To change theme:
```bash
wal -i /path/to/wallpaper.jpg
~/publicdots/scripts/wallpaper.sh --pick
```

## File Structure

```
publicdots/
├── .config/           # Application configurations
│   ├── ghostty/
│   ├── hypr/
│   ├── nvim/
│   ├── rofi/
│   ├── swaync/
│   ├── tmux/
│   ├── wal/
│   └── waybar/
├── scripts/           # Utility scripts
├── images/            # Screenshots and assets
├── .gitignore         # Security safeguards
└── README.md          # This file
```

## Key Bindings

Some notable Hyprland keybindings (Super = Mod key):

| Key | Action |
|-----|--------|
| Super+W | Pick wallpaper |
| Super+Shift+W | Random wallpaper |
| Super+L | Lock screen |
| Super+G | Toggle gaps |
| Super+Shift+L | Toggle dark/light theme |
| Super+S | Screenshot (full) |
| Super+Shift+S | Screenshot (select area) |
| Super+M | Music dropdown |

See `.config/hypr/hyprbinds.conf` for full keybinding list.

## License

Feel free to use and modify these configurations for your own setup.
