#!/bin/bash

# Get the track position and duration using playerctl
position=$(playerctl position)  # current playback position in seconds
length=$(playerctl metadata mpris:length)  # total track length in microseconds

if [ "$length" -eq 0 ]; then
  echo ""
  exit 0
fi

# Convert length from microseconds to seconds
length_in_seconds=$((length / 1000000))

# Calculate progress percentage
percentage=$(echo "100 * $position / $length_in_seconds" | bc -l | awk '{printf "%.0f", $1}') # as a percentage

# Generate circular progress bar using Unicode circle characters
# As an example, let's display the progress in 10 segments using fraction symbols
# You can expand this to 100 segments for a finer granularity

# Define circle segments (empty, quarter, half, 3-quarters, full)
segments=('○' '◔' '◑' '◕' '●')

# Calculate number of filled segments (progress out of 10) 
seg_num=$(awk "BEGIN {print int(($percentage / 100) * 5)}")

# Ensure the progress stays within bounds
if [ "$seg_num" -ge 5 ]; then
  seg_num=5  # Cap at fully completed
fi

# Output the progress in segments 
progress=${segments[$seg_num]}

# Display percentage with the circle
echo "$progress"
