#!/bin/bash

if pgrep -x "hyprsunset" > /dev/null; then
    pkill hyprsunset
else
    hyprsunset --temperature 3500
fi
