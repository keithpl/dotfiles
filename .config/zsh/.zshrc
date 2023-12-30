# vi: ft=zsh

# Load environment variables.
source "$ZDOTDIR/env.zsh"

# Load shell aliases.
source "$ZDOTDIR/alias.zsh"

# Load zsh options.
source "$ZDOTDIR/setopt.zsh"

# Load zsh keyboard bindings.
source "$ZDOTDIR/keybinds.zsh"

# Load "history-fzf" function.
source "$ZDOTDIR/history-fzf.zsh"

# Install zinit plugin manager.
source "$ZDOTDIR/zinit.zsh"

# Completion tweaks.
zstyle ':completion:*' menu select
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:default' list-colors "$(dircolors)"

# Autoload functions.
autoload -Uz compinit && compinit
autoload -Uz colors && colors
autoload -Uz promptinit && promptinit

# Define plugins to be installed by zinit.
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

# Launch tmux if not already running within tmux, do not spawn tmux
# when remotely accessing via ssh.
if command -v tmux &>/dev/null && [[ -z "$TMUX" ]] &&
	[[ -z "$SSH_CLIENT" ]] && [[ -z "$SSH_TTY" ]]; then
	tmux
fi
