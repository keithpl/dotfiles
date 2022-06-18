function history_complete() {
	setopt extended_glob

	local history_cmd="fc -n -l -1 0 | awk '!seen[\$0]++'"
	local fzf_cmd="fzf --height 10% +m +s -e -q \"$BUFFER\""
	local candidates="$(eval $history_cmd | eval $fzf_cmd)"
	local ret="$?"

	if [ -n "$candidates" ]; then
		BUFFER=$(echo $candidates | awk '{gsub(/\\n/,"\n")}1')
		zle vi-fetch-history -n "$BUFFER"
		zle end-of-line
	fi
	zle reset-prompt
	return $ret
}

autoload history_complete
zle -N history_complete
bindkey ^r history_complete

