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

function n() {
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn -R "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

#aliases
#make ls colored
alias ls='ls --color=auto'
alias v='nvim'
alias vim='nvim'
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
