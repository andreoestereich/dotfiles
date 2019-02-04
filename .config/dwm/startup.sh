#!/bin/sh

tgKbmap &
xcompmgr &
trayer --widthtype request --edge top --align right --height 16 --transparent true --alpha 0 --distancefrom right --distance 0 &
nm-applet &
redshift-qt &
~/.dropbox-dist/dropboxd &
dunst &
xbanish &
wallpaper &
while true
do
    xsetroot -name " $(~/.config/dwm/status.sh)"
    sleep 1s
done &
