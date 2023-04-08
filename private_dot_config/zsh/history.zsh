#!/usr/bin/env zsh

setopt append_history
setopt extended_history
setopt hist_ignore_dups

export HISTPATH="$XDG_STATE_HOME/zsh"
export HISTFILE="$HISTPATH/.zsh_history"
export HISTSIZE=1000000
export SAVEHIST=1000000

if [[ ! -d "$HISTPATH" ]]; then
	mkdir -p "$HISTPATH"
fi

history_fzf() {
	local ret
	local candidates
	local fzf_cmd
	local history_cmd

	setopt extended_glob
	history_cmd="fc -n -l -1 0 | awk '!seen[\$0]++'"
	fzf_cmd='fzf --height 10% +m +s -e -q "$BUFFER"'
	candidates="$(eval "$history_cmd" | eval "$fzf_cmd")"
	ret="$?"

	if [[ -n "$candidates" ]]; then
		BUFFER="$(echo "$candidates" | awk '{ gsub(/\\n/, "\n") }1')"
		zle vi-fetch-history -n "$BUFFER"
		zle end-of-line
	fi

	zle reset-prompt
	return $ret
}

autoload history_fzf
zle -N history_fzf
bindkey ^r history_fzf
