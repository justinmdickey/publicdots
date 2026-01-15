#!/bin/bash

if [[ -f /tmp/toggle-gaps ]]; then
  hyprctl keyword general:gaps_out 0
  hyprctl keyword general:gaps_in 0
  hyprctl keyword workspace "m[DP-3] w[tv1], gapsout:0"
  hyprctl keyword decoration:rounding 0
  hyprctl keyword general:border_size 2
  hyprctl keyword decoration:shadow:enabled false
  hyprctl keyword animations:enabled 0
  hyprctl keyword decoration:inactive_opacity 1.0
  hyprctl keyword decoration:dim_inactive false
  rm /tmp/toggle-gaps
else
  hyprctl keyword general:gaps_out 20
  hyprctl keyword general:gaps_in 10
  hyprctl keyword decoration:rounding 20
  hyprctl keyword general:border_size 2
  hyprctl keyword decoration:shadow:enabled true
  hyprctl keyword animations:enabled 1
  hyprctl keyword workspace "m[DP-3] w[tv1], gapsout:20 500"
  touch /tmp/toggle-gaps
fi
