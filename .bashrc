# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# config the cmd text
PS1='\t [\u@$(hostname)] $(pwd)\n> '

#adding more things to be run rightaway
PATH=$PATH:~/.local/bin:~/Dropbox/bin:~/.local/bin:~/Dropbox/toolbox

# Activates vi mode
set -o vi

# opens pywal colorscheme
#(cat ~/.cache/wal/sequences &)

#ranger thing
export RANGER_LOAD_DEFAULT_RC=false
export BROWSER=qutebrowser

# makes xterm transparent
[ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" 0.94 >/dev/null

#aliases 
#make ls pretier
alias ls='ls --color=auto'

alias v='vim'
alias z='zathura'
alias s='startx'
alias ytdm='youtube-dl -x --audio-format "mp3" --audio-quality 320K --add-metadata '
alias cdb='cd ~/Dropbox/comp_sys/knetic_exchange/bcsDC/'
alias cdg='cd ~/Dropbox/comp_sys/knetic_exchange/bcsDCgalam/'
alias caesar='cd "/backup/wine/drive_c/GOG Games/Caesar 3/";WINEARCH=win32 WINEPREFIX=/backup/wine/ wine c3.exe'
alias serv='python3 -m http.server'
alias mu='ncmpcpp'
alias pi='sudo pacman'


