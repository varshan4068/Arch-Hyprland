#!/usr/bin/bash
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(starship init bash)"

alias ls='ls --color=auto'

export LS_COLORS="di=35:fi=32:ln=34"

alias grep='grep --color=auto'

alias nv='nvim'
alias rl='source .bashrc'
alias u='sudo pacman -Syyu'
alias c='clear'
alias ll='ls -Alh'
alias h='history'
alias theme='kitty kitten theme'
alias check='journalctl -xb -p 3'
alias cpu='auto-cpufreq --stats'
alias bar='waybar &'
alias hypr='hyprpaper &'
alias k='killall'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'

cd() {
	builtin cd "$@"
	ll
}

if [ -f /etc/bash_completion ]; then
		./etc/bash_completion
elif [ -f /usr/share/bash_completion ]; then
		./usr/share/bash_completion
fi


