#!/bin/bash
tablet="Wacom ISDv4 90 Pen stylus"
tablet2="Wacom ISDv4 90 Pen eraser"

case "$1" in
    cw)   nextRotate="cw"
          nextOrient="right" ;;
    half) nextRotate="half"
          nextOrient="inverted" ;;
    ccw)  nextRotate="ccw"
          nextOrient="left" ;;
    none) nextRotate="none"
          nextOrient="normal" ;;
esac

# Rotate the screen
xrandr -o $nextOrient

# Rotate the tablet
xsetwacom --set "$tablet" Rotate $nextRotate
xsetwacom --set "$tablet2" Rotate $nextRotate
