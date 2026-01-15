#!/bin/bash
# Toggle script for rounded corners overlay

# Kill if running, otherwise start
if pkill -f "rounded-overlay.py"; then
    exit 0
fi

# Find the gtk4-layer-shell library
GTK_LAYER_SHELL=$(find /usr/lib /usr/lib64 -name "libgtk4-layer-shell.so*" 2>/dev/null | head -n 1)

if [ -z "$GTK_LAYER_SHELL" ]; then
    echo "Error: libgtk4-layer-shell.so not found"
    echo "Please install gtk4-layer-shell package"
    exit 1
fi

# Run the overlay with proper LD_PRELOAD in background
LD_PRELOAD="$GTK_LAYER_SHELL" python3 "$(dirname "$0")/rounded-overlay.py" "$@" &

