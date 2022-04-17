#!/usr/bin/env bash

function get_current_sink() {
	local current_sink_name="$(pactl get-default-sink)"
	echo "$(pactl list sinks short | grep $current_sink_name | cut -f1)"
}

function get_next_sink() {
	local ii=0
	local sinks=()
	local next_sink
	local current_sink

	current_sink=$(get_current_sink)

	while read -r line; do
		local sink_nr=$(echo "$line" | cut -f1)
		sinks[$ii]="$sink_nr"
		((ii++))
	done < <(pactl list sinks short | sort -n)

	if [ ${#sinks[@]} -eq 0 ]; then
		return 1
	fi

	if [ "$current_sink" -ge "${sinks[-1]}" ]; then
		next_sink=${sinks[0]}
	else
		for sink in "${sinks[@]}"; do
			if [ "$current_sink" -lt "$sink" ]; then
				next_sink=$sink
				break
			fi
		done
	fi

	echo "$next_sink"
}

function set_default_sink() {
	pactl set-default-sink "$1"
}

function main() {
	local next_sink

	next_sink="$(get_next_sink)"
	set_default_sink "$next_sink"
}

main "$@"
