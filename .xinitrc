#setxkbmap -option caps:swapescape
#setxkbmap -option compose:ralt
# setxkbmap -layout us,at -option grp:shift_toggle -option grp_led:scroll
# xset r rate 300 50
pipewire&
unclutter --timeout 2 &
#setbg &
redshift &
xset m 0 0
xset s 300 5
xset -dpms
#xss-lock -n /usr/libexec/xsecurelock/dimmer -l -- xsecurelock &
#picom -b
xsetroot -cursor_name left_ptr &
#xrandr --output DVI-I-1 --auto --output HDMI-0 --auto --left-of DVI-I-1
xrandr --output HDMI-0 --auto --output DVI-D-0 --auto --left-of HDMI-0
#syncthing --no-console --no-browser &

exec ~/bin/dwm/run.sh
