#!/bin/sh

mocp -S &
xcompmgr &
trayer --widthtype request --edge top --align right --height 16 --transparent true --alpha 0 --distancefrom right --distance 0 &
nm-applet &
redshift-qt &
~/.dropbox-dist/dropboxd &
dunst &
xbanish &
bash /home/andrelo/Dropbox/bin/randomWall &
$( sleep 1s
while true
do
    xsetroot -name " $(~/.config/dwm/status.sh)"
    sleep 1s
done) &