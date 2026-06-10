# Use emacs bindings because muscle memory.
bindkey -e

# Load fzf keybindings.
# - Ctrl-T: fzf-file-widget
# - Ctrl-R: fzf-history-widget
# - Alt-C: fzf-cd-widget
source /usr/share/fzf/key-bindings.zsh

# Bind keys using string capabilities from terminfo, `man 5 terminfo`
# for more information.
#
# "del" or "delete"
bindkey "${terminfo[kdch1]}" delete-char

# "home"
bindkey "${terminfo[khome]}" beginning-of-line

# "end"
bindkey "${terminfo[kend]}" end-of-line

# "control-space"
bindkey "^@" autosuggest-accept

# "control-left"
bindkey "${terminfo[kLFT5]}" emacs-backward-word

# "control-right"
bindkey "${terminfo[kRIT5]}" emacs-forward-word

# Edit the current command line with $EDITOR.
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
