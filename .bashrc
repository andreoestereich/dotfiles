# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# config the cmd text
PS1='\t [\u@$(hostname)] $(gitPS)$(pwd)\n> '

# enable extra completions for doas
complete -cf doas

[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"
n ()
{
    # Block nesting of nnn in subshells
    if [[ "${NNNLVL:-0}" -ge 1 ]]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The backslash allows one to alias n to nnn if desired without making an
    # infinitely recursive alias
    \nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

GPG_TTY=$(tty)
export GPG_TTY

function yta() {
        mpv --ytdl-format=bestaudio ytdl://ytsearch:"$*"
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
alias pi='doas pacman'
alias pamcan='pacman'
alias sudo='doas'
alias wtt="curl -s wttr.in/mondai-brazil"
alias subd="subliminal --opensubtitles andreoestereich `pass opensubtitles` download -l en"
alias vrVPN="sudo openfortivpn -c ~/.config/ictpvpn"
alias ifVpn="doas openvpn --config ~/Documents/aoestereich/barreira-TCP-1194-aoestereich-config.ovpn --auth-user-pass ~/Documents/aoestereich/pass.txt"
