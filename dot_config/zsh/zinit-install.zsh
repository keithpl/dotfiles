#!/usr/bin/env zsh

ZINIT_HOME="$XDG_DATA_HOME/zinit"

if [[ ! -f "$ZINIT_HOME/zinit.git/zinit.zsh" ]]; then
	mkdir -p "$ZINIT_HOME" && chmod g-rwX "$ZINIT_HOME"
	git clone https://github.com/zdharma-continuum/zinit \
		"$ZINIT_HOME/zinit.git"
fi

source "$ZINIT_HOME/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
