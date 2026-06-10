# Create required directories for zsh if they don't already exist.
() {
	local dirs=(
		"$XDG_STATE_HOME/zsh"
		"$XDG_DATA_HOME/zsh"
		"$XDG_CACHE_HOME/zsh"
	)

	for dir in "${dirs[@]}"; do
		if [[ ! -d "$dir" ]]; then
			mkdir -p --mode=0700 "$dir"
		fi
	done
}
