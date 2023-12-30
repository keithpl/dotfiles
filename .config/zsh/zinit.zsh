# vi: ft=zsh

zinit_home="$XDG_DATA_HOME/zinit/zinit.git"

if [[ ! -d "$zinit_home/.git" ]]; then
	mkdir -p "$(dirname "$zinit_home")"
	git clone https://github.com/zdharma-continuum/zinit "$zinit_home"
fi

source "$zinit_home/zinit.zsh"
