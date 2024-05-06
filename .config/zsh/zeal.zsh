# vi: ft=zsh

export ZEAL_DIR="$XDG_DATA_HOME/zeal"
export ZEAL_PLUGIN_DIR="$ZEAL_DIR/plugins"
export -a ZEAL_INSTALLED_PLUGINS=()

__zeal_plugin_install() {
	local plugin_name="${1:t}"
	local plugin_path="$ZEAL_PLUGIN_DIR/$plugin_name"

	if [[ ! -d "$plugin_path" ]]; then
		echo "-- Plugin Install Started: $1 --"
		git clone "https://github.com/${1}.git" "$plugin_path"
		echo "-- Plugin Install Completed: $1 --\n"
	fi

	ZEAL_INSTALLED_PLUGINS+=("$1")
}

__zeal_plugin_update() {
	for p in "${ZEAL_INSTALLED_PLUGINS[@]}"; do
		echo "-- Plugin Update Started: $p --"
		git -C "$ZEAL_PLUGIN_DIR/${p:t}" pull
		echo "-- Plugin Update Completed: $p --\n"
	done
}

zeal() {
	case "$1" in
		"install") __zeal_plugin_install "${@:2}";;
		"update") __zeal_plugin_update "${@:2}";;
		"clean") __zeal_plugin_clean "${@:2}";;
	esac
}
