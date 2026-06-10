zstyle ':completion:*' menu select
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:default' list-colors "$(dircolors)"

autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
