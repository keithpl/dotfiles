# vi: ft=zsh

# Ignore XON/XOFF flow control messages.
setopt no_flow_control

setopt glob_dots
setopt interactive_comments

setopt append_history
setopt extended_history
setopt hist_ignore_dups

# Do not highlight text pasted into the shell.
zle_highlight=('paste:none')
