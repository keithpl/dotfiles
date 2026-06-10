# Pure prompt.
zeal install "sindresorhus/pure"

fpath+=("$ZEAL_PLUGIN_DIR/pure")
autoload -Uz promptinit && promptinit
prompt pure

# Syntax highlighting.
zeal install "zsh-users/zsh-syntax-highlighting"
source "$ZEAL_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Make comments more visible.
ZSH_HIGHLIGHT_STYLES[comment]="fg=8,bold"

# Enable bracket highlighting.
ZSH_HIGHLIGHT_HIGHLIGHTERS+=("brackets")

# Autosuggestions.
zeal install "zsh-users/zsh-autosuggestions"
source "$ZEAL_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
