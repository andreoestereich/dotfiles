#adding more things to be run rightaway
PATH=$PATH:~/.local/bin

export EDITOR=vim
export BROWSER=firefox
export TERMINAL=st
export PDFVIEWER=zathura
export XDG_CONFIG_HOME=$HOME/.config

export NNN_BMS='t:~/repos/tese/;d:~/Downloads/;h:~/;c:~/.wine/drive_c/SIERRA/Caesar3/'

export GNUPGHOME=$HOME/.config/gnupg

#load ~/.bashrc
test -n "$BASH" && test -r "$HOME/.bashrc" && . "$HOME/.bashrc"

