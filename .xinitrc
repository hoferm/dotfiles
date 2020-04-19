#if [ -x /usr/bin/gpg-agent ]; then
#    eval "$(/usr/bin/gpg-agent --daemon)"
#fi
setxkbmap -option caps:escape
setxkbmap -option compose:ralt
setxkbmap -layout us,at -option grp:shift_toggle -option grp_led:scroll
unclutter --timeout 2 &
feh --bg-fill ~/pictures/wallpaper/rustwall.jpg
redshift &
xset m 0 0
# xsetroot -solid "#191919"
exec bspwm
# exec i3
