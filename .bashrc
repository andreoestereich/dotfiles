# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Activates vi mode
set -o vi

# config the cmd text
PS1='\t [\u@$(hostname)] $(pwd)\n> '

#aliases 
#make ls pretier
alias ls='ls --color=auto'

alias v='vim'
alias z='zathura'
alias s='startx'
alias yt='youtube-viewer -f --player=mpv --append-arg="ytdl-format=22/mp4/best --keep-open"'
alias ytdm='youtube-dl -x --audio-format "mp3" --audio-quality 320K --add-metadata '
alias serv='python3 -m http.server'
alias pi='sudo pacman'
alias cdrt='cd ~/.wine/drive_c/Program\ Files\ \(x86\)/Railroad\ Tycoon\ II/'
alias wtt='curl wttr.in/mondai-brazil'
