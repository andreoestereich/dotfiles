#sets a random wallpaper
/home/andrelo/.local/bin/wallpaper

## systemctl stuff
/etc/X11/xinit/xinitrc.d/50-systemd-user.sh
systemctl --user start X.target

## mouse and keyboard config
xsetroot -cursor_name left_ptr
setxkbmap br

## load keybinds
sxhkd &

exec dwm
