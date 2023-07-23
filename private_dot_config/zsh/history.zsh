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

history_get() {
	fc -rl 1 | awk '{
		cmd=$0;
		sub(/^[ \t]*[0-9]+\**[ \t]+/, "", cmd);
		if (!seen[cmd]++) print $0
	}'
}

history_fzf() {
	fzf --height 10% \
	    -n2..,.. \
	    --scheme=history \
	    --bind=ctrl-r:toggle-sort,ctrl-z:ignore \
	    --query=$LBUFFER \
	    +m
}

history_fzf_widget() {
	local ret
	local num
	local selected

	setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases
	selected=( $(history_get | history_fzf) )
	ret=$?

	if [[ -n "$selected" ]]; then
		num="$selected[1]"
		if [[ -n "$num" ]]; then
			zle vi-fetch-history -n "$num"
		fi
	fi

	zle reset-prompt
	return $ret
}

autoload history_fzf_widget
zle -N history_fzf_widget
bindkey -M emacs '^r' history_fzf_widget
