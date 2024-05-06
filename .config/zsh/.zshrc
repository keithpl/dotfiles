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

# Install my crappy "plugin manager".
source "$ZDOTDIR/zeal.zsh"

# Completion tweaks.
zstyle ':completion:*' menu select
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:default' list-colors "$(dircolors)"

# Autoload functions.
autoload -Uz compinit && compinit
autoload -Uz colors && colors
# autoload -Uz promptinit && promptinit

zeal install "sindresorhus/pure"
fpath+=($ZEAL_PLUGIN_DIR/pure)
autoload -Uz promptinit && promptinit
prompt pure

zeal install "zsh-users/zsh-syntax-highlighting"
source "$ZEAL_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
ZSH_HIGHLIGHT_STYLES[comment]="fg=8,bold"
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets)

zeal install "zsh-users/zsh-autosuggestions"
source "$ZEAL_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"


# Launch tmux if not already running within tmux, do not spawn tmux
# when remotely accessing via ssh.
if command -v tmux &>/dev/null && [[ -z "$TMUX" ]] &&
	[[ -z "$SSH_CLIENT" ]] && [[ -z "$SSH_TTY" ]]; then
	tmux
fi
