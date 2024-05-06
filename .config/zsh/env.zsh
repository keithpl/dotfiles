# vi: ft=zsh

export HISTPATH="$XDG_STATE_HOME/zsh"
export HISTFILE="$HISTPATH/.zsh_history"
export HISTSIZE=1000000
export SAVEHIST=1000000

if [[ ! -d "$HISTPATH" ]]; then
	mkdir -p "$HISTPATH"
fi

export LESSHISTFILE="-"
export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export GOPATH="$XDG_DATA_HOME/go"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

export GPG_TTY="$(tty)"

