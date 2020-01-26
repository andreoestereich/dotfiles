#exec gnome-session

~/.config/dwm/startup.sh &
$(sleep 1s; bash ~/Dropbox/bin/tgKbmap) &
#$(sleep 10s; python ~/Dropbox/bin/wallpaper) &
setroot -cursor_name XC_gumby

sxhkd &
exec bspwm
#exec dwm
