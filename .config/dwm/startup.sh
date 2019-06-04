#!/bin/sh

mocp -S &
xcompmgr &
#trayer --widthtype request --edge top --align right --height 16 --transparent true --alpha 0 --distancefrom right --distance 0 &
#nm-applet &
redshift -l -22.9:-43.1 &
$(sleep 4m; transmission-daemon )&
#~/.dropbox-dist/dropboxd &
dunst &
xbanish &
sxhkd &
bash /home/andrelo/Dropbox/bin/randomWall &
#blueman-applet &
$( sleep 1s
while true
do
    xsetroot -name " $(~/.config/dwm/status.sh)"
    sleep 1s
done) &
