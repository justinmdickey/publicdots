#!/bin/bash

# volume.sh - Universal Linux volume control script
# Supports PipeWire, PulseAudio and ALSA
# Usage: ./volume.sh [up|down|mute|unmute|toggle|status]

# Set to 1 to enable debug output
DEBUG=0

# Amount to increase/decrease (in percentage)
STEP=5

# Find available audio control tools
if command -v pactl &>/dev/null; then
  HAVE_PACTL=1
else
  HAVE_PACTL=0
fi

if command -v amixer &>/dev/null; then
  HAVE_AMIXER=1
else
  HAVE_AMIXER=0
fi

if command -v wpctl &>/dev/null; then
  HAVE_WPCTL=1
else
  HAVE_WPCTL=0
fi

# Debug function
debug() {
  if [ "$DEBUG" -eq 1 ]; then
    echo "DEBUG: $1" >&2
  fi
}

# Helper function to show error and exit
error() {
  echo "Error: $1" >&2
  exit 1
}

# Helper function to show notification (if available)
show_notification() {
  local volume="$1"
  local muted="$2"

  if command -v notify-send &>/dev/null; then
    local icon="audio-volume-high-symbolic"

    if [ "$muted" = "yes" ]; then
      icon="audio-volume-muted-symbolic"
      notify-send -i "$icon" "Volume" "Muted" -h int:value:0 -h string:synchronous:volume
    else
      if [ "$volume" -le 33 ]; then
        icon="audio-volume-low-symbolic"
      elif [ "$volume" -le 66 ]; then
        icon="audio-volume-medium-symbolic"
      fi
      notify-send -i "$icon" "Volume" "$volume%" -h int:value:"$volume" -h string:synchronous:volume
    fi
  fi
}

# Function to change volume using direct PipeWire commands without trying to parse sink IDs
change_volume_wpctl_direct() {
  local action="$1"

  case "$action" in
  up)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ "$STEP"%+
    ;;
  down)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ "$STEP"%-
    ;;
  mute)
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 1
    ;;
  unmute)
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
    ;;
  toggle)
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    ;;
  *)
    return 1
    ;;
  esac

  return 0
}

# Function to get volume and mute status for PipeWire
get_pipewire_volume() {
  local info=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null)
  if [ $? -ne 0 ]; then
    debug "Failed to get PipeWire volume"
    return 1
  fi

  local muted="no"
  if echo "$info" | grep -q "MUTED"; then
    muted="yes"
  fi

  local volume=$(echo "$info" | awk '{print int($2 * 100)}')
  echo "$volume $muted"
  return 0
}

# Function to get volume and mute status for PulseAudio
get_pulse_volume() {
  local sink=$(pactl get-default-sink 2>/dev/null)
  if [ -z "$sink" ]; then
    debug "No default PulseAudio sink found"
    return 1
  fi

  local info=$(pactl get-sink-volume "$sink" 2>/dev/null | head -n 1)
  if [ -z "$info" ]; then
    debug "Failed to get PulseAudio volume"
    return 1
  fi

  # Try different patterns for volume extraction
  local volume=$(echo "$info" | grep -oP '\d+(?=%)' | head -n 1)
  if [ -z "$volume" ]; then
    volume=$(echo "$info" | awk '{print $5}' | tr -d '%')
  fi

  local muted="no"
  local mute_status=$(pactl get-sink-mute "$sink" 2>/dev/null)
  if echo "$mute_status" | grep -q "yes"; then
    muted="yes"
  fi

  echo "$volume $muted"
  return 0
}

# Function to get volume and mute status for ALSA
get_alsa_volume() {
  local info=$(amixer get Master 2>/dev/null | tail -n 1)
  if [ -z "$info" ]; then
    debug "Failed to get ALSA volume"
    return 1
  fi

  local volume=$(echo "$info" | awk -F'[][]' '{print $2}' | tr -d '%')
  local muted="no"
  if echo "$info" | grep -q "\[off\]"; then
    muted="yes"
  fi

  echo "$volume $muted"
  return 0
}

# Function to get volume and mute status using any available method
get_volume_status() {
  local result=""

  # Try PipeWire first
  if [ "$HAVE_WPCTL" -eq 1 ]; then
    result=$(get_pipewire_volume)
    if [ $? -eq 0 ]; then
      echo "$result"
      return 0
    fi
  fi

  # Try PulseAudio next
  if [ "$HAVE_PACTL" -eq 1 ]; then
    result=$(get_pulse_volume)
    if [ $? -eq 0 ]; then
      echo "$result"
      return 0
    fi
  fi

  # Try ALSA last
  if [ "$HAVE_AMIXER" -eq 1 ]; then
    result=$(get_alsa_volume)
    if [ $? -eq 0 ]; then
      echo "$result"
      return 0
    fi
  fi

  # If all methods failed
  echo "0 no"
  return 1
}

# Function to change volume using PulseAudio (pactl)
change_volume_pactl() {
  local action="$1"
  local sink=$(pactl get-default-sink 2>/dev/null)

  if [ -z "$sink" ]; then
    debug "No default PulseAudio sink found"
    return 1
  fi

  case "$action" in
  up)
    pactl set-sink-volume "$sink" +"$STEP"% 2>/dev/null
    ;;
  down)
    pactl set-sink-volume "$sink" -"$STEP"% 2>/dev/null
    ;;
  mute)
    pactl set-sink-mute "$sink" 1 2>/dev/null
    ;;
  unmute)
    pactl set-sink-mute "$sink" 0 2>/dev/null
    ;;
  toggle)
    pactl set-sink-mute "$sink" toggle 2>/dev/null
    ;;
  *)
    return 1
    ;;
  esac

  return 0
}

# Function to change volume using ALSA (amixer)
change_volume_amixer() {
  local action="$1"

  case "$action" in
  up)
    amixer -q set Master "$STEP"%+ unmute 2>/dev/null
    ;;
  down)
    amixer -q set Master "$STEP"%- unmute 2>/dev/null
    ;;
  mute)
    amixer -q set Master mute 2>/dev/null
    ;;
  unmute)
    amixer -q set Master unmute 2>/dev/null
    ;;
  toggle)
    amixer -q set Master toggle 2>/dev/null
    ;;
  *)
    return 1
    ;;
  esac

  return 0
}

# Main function to change volume
change_volume() {
  local action="$1"
  local result=1

  # Try PipeWire first
  if [ "$HAVE_WPCTL" -eq 1 ]; then
    debug "Trying PipeWire volume control"
    if change_volume_wpctl_direct "$action"; then
      debug "PipeWire volume control succeeded"
      return 0
    fi
  fi

  # Try PulseAudio next
  if [ "$HAVE_PACTL" -eq 1 ]; then
    debug "Trying PulseAudio volume control"
    if change_volume_pactl "$action"; then
      debug "PulseAudio volume control succeeded"
      return 0
    fi
  fi

  # Try ALSA last
  if [ "$HAVE_AMIXER" -eq 1 ]; then
    debug "Trying ALSA volume control"
    if change_volume_amixer "$action"; then
      debug "ALSA volume control succeeded"
      return 0
    fi
  fi

  error "Failed to change volume using any available method"
}

# Function to debug audio systems
debug_audio_systems() {
  echo "=== Audio System Debug ==="
  echo "PipeWire (wpctl): $([ "$HAVE_WPCTL" -eq 1 ] && echo "Available" || echo "Not available")"
  echo "PulseAudio (pactl): $([ "$HAVE_PACTL" -eq 1 ] && echo "Available" || echo "Not available")"
  echo "ALSA (amixer): $([ "$HAVE_AMIXER" -eq 1 ] && echo "Available" || echo "Not available")"

  if [ "$HAVE_WPCTL" -eq 1 ]; then
    echo ""
    echo "=== PipeWire Status ==="
    wpctl status

    echo ""
    echo "=== PipeWire Default Sink Volume ==="
    wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>&1
  fi

  if [ "$HAVE_PACTL" -eq 1 ]; then
    echo ""
    echo "=== PulseAudio Sinks ==="
    pactl list sinks short 2>&1

    echo ""
    echo "=== PulseAudio Default Sink ==="
    pactl get-default-sink 2>&1
  fi

  if [ "$HAVE_AMIXER" -eq 1 ]; then
    echo ""
    echo "=== ALSA Controls ==="
    amixer scontrols 2>&1

    echo ""
    echo "=== ALSA Master Volume ==="
    amixer get Master 2>&1
  fi

  echo ""
  echo "=== Current Volume Status ==="
  read -r volume muted <<<"$(get_volume_status)"
  if [ "$muted" = "yes" ]; then
    echo "Volume: MUTED ($volume%)"
  else
    echo "Volume: $volume%"
  fi
}

# Check for command line arguments
if [ $# -lt 1 ]; then
  echo "Usage: $0 [up|down|mute|unmute|toggle|status|debug]"
  exit 1
fi

ACTION="$1"

case "$ACTION" in
up | down | mute | unmute | toggle)
  change_volume "$ACTION"
  # Get and display the new volume status
  read -r VOLUME MUTED <<<"$(get_volume_status)"
  show_notification "$VOLUME" "$MUTED"
  ;;
status)
  read -r VOLUME MUTED <<<"$(get_volume_status)"
  if [ "$MUTED" = "yes" ]; then
    echo "Volume: MUTED ($VOLUME%)"
  else
    echo "Volume: $VOLUME%"
  fi
  ;;
debug)
  debug_audio_systems
  ;;
*)
  echo "Unknown command: $ACTION"
  echo "Usage: $0 [up|down|mute|unmute|toggle|status|debug]"
  exit 1
  ;;
esac

exit 0
