# Do not load these options if the session is not interactive.
[[ $- != *i* ]] && return 1

# Set emacs mode.
bindkey -e

zstyle :compinstall filename '${HOME}/.zshrc'

autoload -Uz compinit && compinit
autoload -Uz colors && colors

export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

export PROMPT="%B%F{red}%(?..%? )%B%F{blue}%n%f%b@%m %B%40<..<%~%<< %b%# "

setopt append_history
setopt extended_history
setopt hist_ignore_space
setopt hist_ignore_dups

alias vim='nvim'
alias vimdiff='nvim -d'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias history='history -i'
alias tb='nc termbin.com 9999'

case "$OSTYPE" in
linux*)
	alias ip='ip -color=auto'
	alias ls='ls -Fv --group-directories-first --color=auto'
	alias dmesg='dmesg --color=always'
	alias weechat='firejail --private=${HOME}/jails/weechat -- weechat'
	;;
darwin*)
	alias ls='ls -Fv --color=auto'

	function brewup() {
		brew cleanup
		brew doctor && brew update && brew upgrade
	}
	;;
esac

# Launch tmux if not already running within tmux.
if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then tmux; fi
