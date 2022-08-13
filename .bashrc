# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# config the cmd text
PS1='\t [\u@$(hostname)] $(gitPS)$(pwd)\n> '

GPG_TTY=$(tty)
export GPG_TTY

function yta() {
        mpv --ytdl-format=bestaudio ytdl://ytsearch:"$*"
    }

function swallow() {
    id=$(xdo id)
    xdo hide
    $("$@") > /dev/null 2>&1
    xdo show "$id"
    unset id
}

#aliases
#make ls colored
alias ls='ls --color=auto'
alias v='chicon -t nvim "/usr/share/pixmaps/nvim.png"'
alias vim='chicon -t nvim "/usr/share/pixmaps/nvim.png"'
alias z='zathura'
alias m='mpv'
alias julius='cd /home/andrelo/.wine/drive_c/GOG\ Games/Caesar\ 3/; julius-game'
alias augustus='cd /home/andrelo/.wine/drive_c/GOG\ Games/Caesar\ 3/; augustus-game'
alias s='startx'
alias yt='youtube-viewer -f --player=mpv --append-arg="ytdl-format=22/mp4/best --keep-open"'
alias ytdm='youtube-dl -x --audio-format "mp3" --audio-quality 320K '
alias serv='python3 -m http.server'
alias pi='sudo pacman'
alias pamcan='pacman'
alias wtt="curl -s wttr.in/mondai-brazil"
alias subd="subliminal --opensubtitles andreoestereich `pass opensubtitles` download -l en"
alias vrVPN="sudo openfortivpn -c ~/.config/ictpvpn"
