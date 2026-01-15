#!/usr/bin/env python3
"""
Rounded corners overlay for Hyprland using GTK4 Layer Shell
"""

import gi
import cairo
import sys
import os
import json
from pathlib import Path

gi.require_version("Gtk", "4.0")
gi.require_version("Gtk4LayerShell", "1.0")

from gi.repository import Gtk, Gdk, GLib
from gi.repository import Gtk4LayerShell as LayerShell

# ============= CONFIGURATION =============
# Corner radius in pixels (can be overridden by command line argument)
DEFAULT_CORNER_RADIUS = 24

# Corner color (RGBA values from 0.0 to 1.0)
# This will be overridden by pywal colors if available
# Fallback color if pywal is not available
FALLBACK_CORNER_COLOR = (1, 1, 1, 1)

# Pywal color to use (color0 is typically the background/dark color)
# Options: "color0" through "color15", "background", "foreground", "cursor"
PYWAL_COLOR_NAME = "background"
# =========================================


def hex_to_rgba(hex_color, alpha=1.0):
    """Convert hex color string to RGBA tuple (0.0-1.0 range)"""
    hex_color = hex_color.lstrip("#")
    r = int(hex_color[0:2], 16) / 255.0
    g = int(hex_color[2:4], 16) / 255.0
    b = int(hex_color[4:6], 16) / 255.0
    return (r, g, b, alpha)


def load_pywal_color(color_name=PYWAL_COLOR_NAME):
    """Load color from pywal cache"""
    colors_json_path = Path.home() / ".cache" / "wal" / "colors.json"

    try:
        with open(colors_json_path, "r") as f:
            colors_data = json.load(f)

        # Try to get color from colors dict first, then special dict
        if color_name in colors_data.get("colors", {}):
            hex_color = colors_data["colors"][color_name]
        elif color_name in colors_data.get("special", {}):
            hex_color = colors_data["special"][color_name]
        else:
            print(
                f"Warning: Color '{color_name}' not found in pywal cache, using fallback"
            )
            return FALLBACK_CORNER_COLOR

        return hex_to_rgba(hex_color)

    except FileNotFoundError:
        print(
            f"Warning: Pywal colors not found at {colors_json_path}, using fallback color"
        )
        return FALLBACK_CORNER_COLOR
    except Exception as e:
        print(f"Warning: Error loading pywal colors: {e}, using fallback color")
        return FALLBACK_CORNER_COLOR


# Load corner color from pywal
CORNER_COLOR = load_pywal_color()
print(f"Using corner color: {CORNER_COLOR}")

# Preload gtk4-layer-shell to fix linking order
if "LD_PRELOAD" not in os.environ:
    try:
        os.environ["LD_PRELOAD"] = "/usr/lib/libgtk4-layer-shell.so"
        os.execv(sys.executable, [sys.executable] + sys.argv)
    except:
        pass


class RoundedCornersOverlay:
    def __init__(self, corner_radius=DEFAULT_CORNER_RADIUS):
        self.corner_radius = corner_radius
        self.corner_color = CORNER_COLOR

        # Create the main window
        self.window = Gtk.Window()

        # Initialize layer shell
        LayerShell.init_for_window(self.window)

        # Set layer shell properties - use TOP layer to be above waybar
        LayerShell.set_layer(self.window, LayerShell.Layer.TOP)
        LayerShell.set_namespace(self.window, "rounded-corners-overlay")

        # Anchor to all edges to cover the entire screen
        LayerShell.set_anchor(self.window, LayerShell.Edge.TOP, True)
        LayerShell.set_anchor(self.window, LayerShell.Edge.BOTTOM, True)
        LayerShell.set_anchor(self.window, LayerShell.Edge.LEFT, True)
        LayerShell.set_anchor(self.window, LayerShell.Edge.RIGHT, True)

        # Set exclusive zone to 0 so it doesn't push other windows
        LayerShell.set_exclusive_zone(self.window, 0)

        # Allow keyboard interactivity to pass through
        LayerShell.set_keyboard_mode(self.window, LayerShell.KeyboardMode.NONE)

        # Create drawing area for the corners
        self.drawing_area = Gtk.DrawingArea()
        self.drawing_area.set_draw_func(self.on_draw)

        self.window.set_child(self.drawing_area)

        # Make window transparent and click-through
        self.window.set_name("rounded-corners-overlay")

        # Load CSS for transparency
        css_provider = Gtk.CssProvider()
        css_provider.load_from_data(b"""
            window {
                background-color: transparent;
            }
        """)

        Gtk.StyleContext.add_provider_for_display(
            Gdk.Display.get_default(),
            css_provider,
            Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION,
        )

        # Connect to realize signal to set input region after window is created
        self.window.connect("realize", self.on_realize)

        self.window.present()

    def on_realize(self, widget):
        """Set input region to empty so clicks pass through"""
        surface = self.window.get_surface()
        if surface:
            region = cairo.Region()
            surface.set_input_region(region)

    def on_draw(self, area, cr, width, height):
        """Draw rounded corner masks"""
        # Clear the surface
        cr.set_operator(cairo.OPERATOR_CLEAR)
        cr.paint()

        # Set drawing mode back to normal
        cr.set_operator(cairo.OPERATOR_OVER)

        # Set color (from configuration)
        cr.set_source_rgba(*self.corner_color)

        radius = self.corner_radius

        # Draw corner rectangles (to create the rounded corner effect)
        # Top-left corner
        cr.rectangle(0, 0, radius, radius)
        cr.fill()

        # Top-right corner
        cr.rectangle(width - radius, 0, radius, radius)
        cr.fill()

        # Bottom-left corner
        cr.rectangle(0, height - radius, radius, radius)
        cr.fill()

        # Bottom-right corner
        cr.rectangle(width - radius, height - radius, radius, radius)
        cr.fill()

        # Now cut out the rounded corners
        cr.set_operator(cairo.OPERATOR_CLEAR)

        # Top-left rounded cutout
        cr.arc(radius, radius, radius, 0, 2 * 3.14159)
        cr.fill()

        # Top-right rounded cutout
        cr.arc(width - radius, radius, radius, 0, 2 * 3.14159)
        cr.fill()

        # Bottom-left rounded cutout
        cr.arc(radius, height - radius, radius, 0, 2 * 3.14159)
        cr.fill()

        # Bottom-right rounded cutout
        cr.arc(width - radius, height - radius, radius, 0, 2 * 3.14159)
        cr.fill()


def main():
    corner_radius = DEFAULT_CORNER_RADIUS

    # Parse command line arguments
    if len(sys.argv) > 1:
        try:
            corner_radius = int(sys.argv[1])
        except ValueError:
            print(f"Usage: {sys.argv[0]} [corner_radius]")
            print(f"Invalid corner radius. Using default: {corner_radius}")

    app = RoundedCornersOverlay(corner_radius)

    # Create GLib main loop
    loop = GLib.MainLoop()

    try:
        loop.run()
    except KeyboardInterrupt:
        print("\nExiting...")
        sys.exit(0)


if __name__ == "__main__":
    main()
