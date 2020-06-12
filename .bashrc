# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# config the cmd text
PS1='\t [\u@$(hostname)] $(gitPS)$(pwd)\n> '

#aliases 
#make ls colored
alias ls='ls --color=auto'

function yta() {
        mpv --ytdl-format=bestaudio ytdl://ytsearch:"$*"
    }

alias v='nvim'
alias z='zathura'
alias s='startx'
alias yt='youtube-viewer -f --player=mpv --append-arg="ytdl-format=22/mp4/best --keep-open"'
alias ytdm='youtube-dl -x --audio-format "mp3" --audio-quality 320K --add-metadata '
alias serv='python3 -m http.server'
alias pi='sudo pacman'
alias cdc='cd /home/andrelo/.wine/drive_c/SIERRA/Caesar3/'
alias wtt="curl -s wttr.in/mondai-brazil"
alias neomutt='neomutt; pkill -RTMIN+2 lemonblocks;'

