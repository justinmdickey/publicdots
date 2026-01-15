#!/bin/bash

album_art=$(playerctl -p spotify metadata mpris:artUrl)
if [[ -z $album_art ]] 
then
   # spotify is dead, we should die too.
   rm -rf "/tmp/cover.jpeg"
   exit
fi
curl -s  "${album_art}" --output "/tmp/cover.jpeg"
echo "/tmp/cover.jpeg"
