if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
	mkdir -p "$HOME/.local/share/zinit" && \
		chmod g-rwX "$HOME/.local/share/zinit"
	git clone https://github.com/zdharma-continuum/zinit \
		"$HOME/.local/share/zinit/zinit.git"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
	zdharma-continuum/zinit-annex-as-monitor \
	zdharma-continuum/zinit-annex-bin-gem-node \
	zdharma-continuum/zinit-annex-patch-dl \
	zdharma-continuum/zinit-annex-rust
