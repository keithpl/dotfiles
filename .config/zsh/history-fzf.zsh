# vi: ft=zsh

history-fzf() {
	local ret
	local num
	local selected

	setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases

	selected=($(
		fc -rl 1 | awk '{
			cmd=$0;
			sub(/^[ \t]*[0-9]+\**[ \t]+/, "", cmd);
			if (!seed[cmd]++) print $0
		}' | fzf --height 10%					\
			 -n2..,..					\
			 --scheme=history				\
			 --bind=ctrl-r:toggle-sort,ctrl-z:ignore	\
			 --query="$LBUFFER"				\
			 +m
	))

	ret="$?"

	if [[ -n "$selected" ]]; then
		num="$selected[1]"
		if [[ -n "$num" ]]; then
			zle vi-fetch-history -n "$num"
		fi
	fi
	zle reset-prompt
	return $ret
}
