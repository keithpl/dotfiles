# vi: ft=zsh

alias vim="nvim"
alias vimdiff="nvim -d -c 'tabdo windo set nolist'"
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias dmesg="dmesg --color=always"
alias history="history -i"
alias tb="nc termbin 9999"
alias ls="eza -g --group-directories-first"
alias tree="eza --tree"
alias ip="ip -color=auto"

alias weechat='firejail --private="$XDG_DATA_HOME/firejail/weechat" -- weechat'

