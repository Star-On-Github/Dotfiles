#!/bin/bash
CHECK_LAYOUT=$(xset -q | grep "LED mask" | awk '{print $NF}')
if [ "$CHECK_LAYOUT" == "00000000" ]; then
    LAYOUT="US"
else
    LAYOUT="ARA"
fi
echo "Layout: $LAYOUT"
