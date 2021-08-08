#!/usr/bin/sh

xrandr --output DVI-I-1 --auto --output HDMI-0 --auto --left-of DVI-I-1
xsetroot -cursor_name left_ptr &
# bar &
mv ~/.local/share/penrose/zwm.log ~/.local/share/penrose/old-zwm.log
exec dwmblocks
