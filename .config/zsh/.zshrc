# vi: ft=zsh
# Do not load these options if the session is not interactive.
if [[ $- != *i* ]]; then
	return 1
fi

bindkey -e

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

bindkey '^[[Z' end-of-line
bindkey '^[[1;5D' emacs-backward-word
bindkey '^[[1;5C' emacs-forward-word

zstyle :compinstall filename '$ZDOTDIR/.zshrc'

autoload -Uz compinit && compinit
autoload -Uz colors && colors
autoload -Uz promptinit && promptinit

setopt glob_dots

export LESSHISTFILE="-"
export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export GOPATH="$XDG_DATA_HOME/go"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export GPG_TTY="$(tty)"

alias vim='nvim'
alias vimdiff='nvim -d -c "tabdo windo set nolist"'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias history='history -i'
alias tb='nc termbin.com 9999'
alias ls='eza -g --group-directories-first'
alias tree='eza --tree'
alias ip='ip -color=auto'
alias dmesg='dmesg --color=always'
alias weechat='firejail --private="$XDG_DATA_HOME/firejail/weechat" -- weechat'

source "$ZDOTDIR/history.zsh"
source "$ZDOTDIR/zinit-install.zsh"

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# Launch tmux if not already running within tmux, do not spawn tmux
# when remotely accessing via ssh.
if command -v tmux &>/dev/null && [[ -z "$TMUX" ]] &&
	[[ -z "$SSH_CLIENT" ]] && [[ -z "$SSH_TTY" ]]; then
	tmux
fi