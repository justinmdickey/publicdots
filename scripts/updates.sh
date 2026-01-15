#!/bin/bash
COUNT=$(exec yay -Qu | wc -l)
echo -n "󰮯 $COUNT"
