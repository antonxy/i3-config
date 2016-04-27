#!/bin/sh

xsetwacom --list devices | grep -oP 'id: \K([0-9]+)' | xargs -i xsetwacom --set {} MapToOutput LVDS1
