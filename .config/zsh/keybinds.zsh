# vi: ft=zsh

# Use emacs bindings because muscle memory.
bindkey -e

# Bind keys using string capabilities from terminfo, `man 5 terminfo` for
# more information.
#
# "del" or "delete".
bindkey "${terminfo[kdch1]}" delete-char

# "home"
bindkey "${terminfo[khome]}" beginning-of-line

# "end"
bindkey "${terminfo[kend]}" end-of-line

# "back-tab" or "shift+tab"
zle -N autosuggest-accept
bindkey "${terminfo[kcbt]}" autosuggest-accept

# "control-left"
bindkey "${terminfo[kLFT5]}" emacs-backward-word

# "control-right"
bindkey "${terminfo[kRIT5]}" emacs-forward-word

# Search history with fzf, defined in "$ZDOTDIR/history-fzf.zsh"
autoload -z history-fzf
zle -N history-fzf
bindkey '^R' history-fzf

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
