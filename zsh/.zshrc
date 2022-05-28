# Do not load these options if the session is not interactive.
[[ $- != *i* ]] && return 1

# Set emacs mode.
bindkey -e

zstyle :compinstall filename '${HOME}/.zshrc'

autoload -Uz compinit && compinit
autoload -Uz colors && colors
autoload -Uz promptinit && promptinit && prompt pure

export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

setopt append_history
setopt extended_history
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

	plugin_base="/usr/share/zsh/plugins/"
	;;
darwin*)
	alias ls='ls -Fv --color=auto'
	alias brewup='brew cleanup; brew doctor && brew update && brew upgrade'

	fpath+=$(brew --prefix)/share/zsh-completions
	fpath+=$(brew --prefix)/share/zsh/site-functions

	plugin_base="$(brew --prefix)/share/"
	;;
esac

source ~/.zsh/history-complete.zsh
source $plugin_base/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Launch tmux if not already running within tmux.
if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then tmux; fi
