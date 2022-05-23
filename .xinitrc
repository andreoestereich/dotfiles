
#systemctl --user start X.target

~/.config/dwm/startup.sh &
xsetroot -cursor_name left_ptr
#~/.xmonad/startup.sh &

~/.fehbg &

sxhkd &
setxkbmap br

#exec bspwm
exec dwm
#exec xmonad
#exec startlxde
