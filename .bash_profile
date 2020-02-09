#adding more things to be run rightaway
PATH=$PATH:~/.local/bin

export EDITOR=vim
export BROWSER=brave
export TERMINAL=st
export PDFVIEWER=zathura
export XDG_CONFIG_HOME=$HOME/.config

export NNN_BMS='t:~/repos/tese/;d:~/Downloads/;h:~/;c:~/.wine/drive_c/SIERRA/Caesar3/'

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export GNUPGHOME=$HOME/.config/gnupg

#load ~/.bashrc
test -n "$BASH" && test -r "$HOME/.bashrc" && . "$HOME/.bashrc"

