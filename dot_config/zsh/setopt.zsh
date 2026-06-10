# Ignore XON/XOFF (Ctrl+Q/Ctrl+S) flow control messages.
# - XON (Ctrl+Q): resumes terminal output
# - XOFF (Ctrl+S): freezes terminal output
setopt no_flow_control

# Include dotfiles in matches to wildcard patterns.
setopt glob_dots

# Allow comments in interactive shells.
setopt interactive_comments

# Append history to the HISTFILE, don't replace it.
setopt append_history

# Include a timestamp for history entries.
setopt extended_history

# Ignore consecutive duplicate entries into the history.
setopt hist_ignore_dups

# Remove superfluous whitespace from history entries.
setopt hist_reduce_blanks
