#adding more things to be run rightaway
export PATH=$PATH:~/.local/bin

export EDITOR=nvim
export BROWSER=qutebrowser
export TERMINAL=st
export PDFVIEWER=zathura
export XDG_CONFIG_HOME=$HOME/.config

#icons
export TERM_ICON="/usr/local/share/pixmaps/st.png"
export NNN_ICON="/usr/share/icons/hicolor/64x64/apps/nnn.png"
export NVIM_ICON="/usr/share/pixmaps/nvim.png"

#nnn configs
export NNN_OPENER=nuke
export NNN_BMS='d:~/Downloads/;h:~/;l:~/repos/edushit/em/'
export NNN_PLUG='i:imgview;d:fzcd;o:xdgdefault'
export NNN_FIFO=/tmp/nnn.fifo

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GNUPGHOME=$HOME/.config/gnupg

#load ~/.bashrc
test -n "$BASH" && test -r "$HOME/.bashrc" && . "$HOME/.bashrc"
