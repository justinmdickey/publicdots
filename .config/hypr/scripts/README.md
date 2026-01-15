# Rounded Corners Overlay for Hyprland

A layer shell overlay that adds rounded corners to your entire screen in Hyprland.

## Dependencies

- Python 3
- GTK4
- gtk4-layer-shell
- PyGObject

### Installing Dependencies

**Arch Linux:**
```bash
sudo pacman -S gtk4 gtk4-layer-shell python-gobject
```

**Fedora:**
```bash
sudo dnf install gtk4 gtk4-layer-shell python3-gobject
```

**Ubuntu/Debian:**
```bash
sudo apt install gir1.2-gtk-4.0 gtk4-layer-shell python3-gi
```

## Usage

Run the overlay with default corner radius (20px):
```bash
python3 rounded-overlay.py
```

Run with custom corner radius:
```bash
python3 rounded-overlay.py 30
```

## Running at Startup

Add to your Hyprland config (`~/.config/hypr/hyprland.conf`):
```
exec-once = python3 /home/justin/Dev/rounded/rounded-overlay.py
```

## How it Works

This script creates a GTK4 Layer Shell window that:
- Sits on the OVERLAY layer (above all other windows)
- Is anchored to all screen edges
- Is transparent and click-through
- Draws black rectangles in the corners with rounded cutouts to create the rounded corner effect

The overlay doesn't interfere with input or keyboard events, so you can interact with windows normally underneath it.
