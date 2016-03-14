#!/bin/sh

case $1 in
   "play")
       key="PlayPause"
       ;;
   "next")
       key="Next"
       ;;
   "prev")
       key="Previous"
       ;;
   *)
       echo "Usage: $0 play|next|prev"
       exit 1
        ;;
esac
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.$key
exit 0
