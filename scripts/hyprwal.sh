#!/bin/bash
# get monitor

mon=$(hyprctl monitors | awk '{print $2}' | sed -n 1p)

walDir=$HOME/Pictures/gradient
walPic=$(ls $walDir | shuf -n 1)
wal=$walDir/$walPic

hyprctl hyprpaper preload $wal &&
hyprctl hyprpaper wallpaper $mon,$wal && 

cp $wal $HOME/Pictures/wal.png
#notify-send.sh -i $wal "Wallpaper Updated"

echo "setting" $walPic "on" $mon
