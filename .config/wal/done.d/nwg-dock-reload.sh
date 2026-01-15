#!/usr/bin/env bash

# Pywal hook to recompile nwg-dock-hyprland and nwg-drawer styles
# This script is automatically run after pywal changes colors

# Compile the dock SCSS file
~/.config/nwg-dock-hyprland/compile.sh

# Compile the drawer SCSS file
~/.config/nwg-drawer/compile.sh
