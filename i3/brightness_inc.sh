#!/bin/bash

# Get the current brightness value
brightness=$(light -G | awk '{printf "%.0f", $1}')

# Increase the brightness by 5%
if (( brightness + 5 > 100 )); then
    brightness=100
else
    brightness=$(( brightness + 5 ))
fi

# Set the new brightness value
light -S "$brightness"
