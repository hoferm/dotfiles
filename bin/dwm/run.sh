#!/bin/sh

feh --bg-fill ~/.local/share/d/pictures/wallpaper/Street.jpg &
xset r rate 200 50 &
# pipewire &
# wireplumber &
picom &

~/bin/dwm/bar.sh &
while type dwm >/dev/null; do dwm && continue || break; done
