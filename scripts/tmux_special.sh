#!/bin/bash

SESSION_NAME="special"

# Create the new session, starting with the default window
tmux new-session -d -s $SESSION_NAME

# Rename the first window and run btop on the left 75%
tmux rename-window -t $SESSION_NAME:1 "main_window"
tmux send-keys -t $SESSION_NAME:1 "gotop" C-m

# Split the window vertically for the right side (25%)
tmux split-window -h -p 30 -t $SESSION_NAME:1

# Split the right side into 3 vertical panes
tmux split-window -v -p 72 -t $SESSION_NAME:1.2
tmux split-window -v -p 20 -t $SESSION_NAME:1.3

# Send commands to the right-side panes
tmux send-keys -t $SESSION_NAME:1.2 "sleep 1 && clock -C 4" C-m
tmux send-keys -t $SESSION_NAME:1.3 "goplaying -c 4" C-m
tmux send-keys -t $SESSION_NAME:1.4 "cava" C-m

# Attach to the session
tmux attach-session -t $SESSION_NAME
