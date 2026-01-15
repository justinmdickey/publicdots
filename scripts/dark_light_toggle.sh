#!/bin/bash

# Get current color scheme
current_scheme=$(gsettings get org.gnome.desktop.interface color-scheme)

if [[ "$current_scheme" == "'prefer-dark'" ]]; then
  # Switch to light mode
  echo "Switching to light mode..."
  gsettings set org.gnome.desktop.interface color-scheme prefer-light
  wal --theme justin-adw-light -l
  hyprctl reload
  echo "Light mode activated"
else
  # Switch to dark mode
  echo "Switching to dark mode..."
  gsettings set org.gnome.desktop.interface color-scheme prefer-dark
  wal --theme justin-adw
  hyprctl reload
  echo "Dark mode activated"
fi
