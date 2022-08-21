# Do not load these options if the session is not interactive.
[[ $- != *i* ]] && return 1

# Set emacs mode.
bindkey -e

# use end-of-line instead of autosuggest-accept to preserve syntax highlighting
bindkey '^[[Z' end-of-line

zstyle :compinstall filename '$ZDOTDIR/.zshrc'

autoload -Uz compinit && compinit
autoload -Uz colors && colors
autoload -Uz promptinit && promptinit

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=100000

setopt append_history
setopt extended_history
setopt hist_ignore_dups

alias vim='nvim'
alias vimdiff='nvim -d -c "tabdo windo set nolist"'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias history='history -i'
alias tb='nc termbin.com 9999'
alias ls='exa -g --group-directories-first'

case "$OSTYPE" in
"linux"*)
	alias ip='ip -color=auto'
	alias dmesg='dmesg --color=always'
	alias weechat='firejail --private=${HOME}/jails/weechat -- weechat'
	;;
"darwin"*)
	alias brewup='brew cleanup; brew doctor && brew update && brew upgrade'
	;;
esac

source "$ZDOTDIR/history-complete.zsh"
source "$ZDOTDIR/zinit-install.zsh"

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# Launch tmux if not already running within tmux.
if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then tmux; fi
