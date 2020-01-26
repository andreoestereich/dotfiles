# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# config the cmd text
PS1='\t [\u@$(hostname)] $(gitPS)$(pwd)\n> '

#aliases 
#make ls pretier
alias ls='ls --color=auto'

alias v='vim -c "set title"'
alias z='zathura'
alias s='startx'
alias yt='youtube-viewer -f --player=mpv --append-arg="ytdl-format=22/mp4/best --keep-open"'
alias ytdm='youtube-dl -x --audio-format "mp3" --audio-quality 320K --add-metadata '
alias serv='python3 -m http.server'
alias pi='sudo pacman'
alias cdc='cd /home/andrelo/.wine/drive_c/SIERRA/Caesar3/'
alias wtt="cat $HOME/.local/share/weatherreport"

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1

_powerline_columns_fallback() {
	if which stty &>/dev/null ; then
		local cols="$(stty size 2>/dev/null)"
		if ! test -z "$cols" ; then
			echo "${cols#* }"
			return 0
		fi
	fi
	echo 0
	return 0
}

