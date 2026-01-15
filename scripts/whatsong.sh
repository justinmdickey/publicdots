#!/bin/bash

# First check if playerctl is installed
if ! command -v playerctl &>/dev/null; then
  echo "playerctl not found. Please install it first."
  exit 1
fi

# Check if Spotify is running and get its status
if ! playerctl -p spotify status &>/dev/null; then
  echo ""
  exit 0
fi

# Get the song info only from Spotify
song_info=$(playerctl -p spotify metadata --format '{{artist}} - {{title}}' 2>/dev/null)

# Only output if we got actual information
if [[ -n "$song_info" ]]; then
  echo "$song_info"
else
  echo ""
fi
