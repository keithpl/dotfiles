# ZSH history settings.
# These don't need to be exported as they're configuration for zsh.
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=1000000
SAVEHIST=1000000

# Disable the history file for less.
export LESSHISTFILE="-"

# Use nvim as the pager for man.
export MANPAGER="nvim +Man!"

# Relocate data to XDG directories for tools that don't respect XDG
# by default.
export GOPATH="$XDG_DATA_HOME/go"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nvidia/ComputeCache"
