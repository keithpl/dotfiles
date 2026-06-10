alias vim="nvim"
alias vimdiff="nvim -d"

alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias ip="ip -color=auto"
alias dmesg="dmesg --color=auto"

alias ls="eza -g --group-directories-first"
alias tree="eza --tree"
alias history="history -i"

alias tb="nc termbin.com 9999"

weechat() {
	firejail --private="$XDG_DATA_HOME/firejail/weechat" -- weechat "$@"
}
