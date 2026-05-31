# vi: ft=zsh

export ZEAL_DIR="$XDG_DATA_HOME/zeal"
export ZEAL_PLUGIN_DIR="$ZEAL_DIR/plugins"
export -a ZEAL_INSTALLED_PLUGINS=()

__zeal_git_install() {
	git clone --quiet --depth=1 \
		"https://github.com/${1}.git" "$2"
}

__zeal_git_update() {
	git -C "$1" fetch --quiet --depth=1 origin && \
		git -C "$1" reset --quiet --hard origin/HEAD
}

__zeal_plugin_install() {
	local plugin_name="${1:t}"
	local plugin_path="$ZEAL_PLUGIN_DIR/$plugin_name"

	if [[ ! -d "$plugin_path" ]]; then
		print "zeal: installing $1"
		if ! __zeal_git_install "$1" "$plugin_path"; then
			print "zeal: failed to install $1"
			print
			rm -rf "$plugin_path"
			return 1
		fi
		print "zeal: installed $1"
		print
	fi

	ZEAL_INSTALLED_PLUGINS+=("$1")
}

__zeal_plugin_update() {
	for p in "${ZEAL_INSTALLED_PLUGINS[@]}"; do
		local plugin_path="$ZEAL_PLUGIN_DIR/${p:t}"
		print "zeal: updating $p"

		if ! __zeal_git_update "$plugin_path"; then
			print "zeal: error: failed to update $p"
		else
			print "zeal: updated $p"
		fi
		print
	done
}

zeal() {
	case "$1" in
		"install") __zeal_plugin_install "${@:2}";;
		"update") __zeal_plugin_update "${@:2}";;
	esac
}
