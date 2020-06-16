setxkbmap -option caps:escape
setxkbmap -option compose:ralt
setxkbmap -layout us,at -option grp:shift_toggle -option grp_led:scroll
unclutter --timeout 2 &
feh --bg-fill ~/pictures/wallpaper/tmp.jpg
redshift &
xset m 0 0
picom -b
exec bspwm
