# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function y() {
	local tmp cwd; tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
	command rm -f -- "$tmp"
}

# BASH PROMPT LOOK	
   # Black:30  Blue:34  Cyan:36   Green:32   Purple:35   Red:31   White:37   Yellow:33
PS1='\[\033[1;31m\][\[\033[1;33m\]\u\[\033[1;37m\]@\[\033[1;34m\]\h \[\033[1;37m\]\w\[\033[1;31m\]]\[\033[00m\]\$ '

alias ls='ls --color=auto'


