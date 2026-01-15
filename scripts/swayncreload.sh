#!/bin/bash
sassc "$HOME/.config/swaync/style.scss" "$HOME/.config/swaync/style.css" &&
swaync-client -R &&
swaync-client -rs
