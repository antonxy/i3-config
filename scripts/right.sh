#!/bin/sh
setxkbmap -layout us
xkbset m
xkbset exp =m
xmodmap -e "keycode 135 = Pointer_Button3"
