export LS_COLORS="di=01;34"
PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

. ~/dotfiles/git-prompt.sh
PS1='\[\e]0;\w\a\]\[\e[1m\]\u@\h\[\e[0m\]\[\e[1;38;5;52m\](\[\e[0m\]\w\[\e[1;38;5;52m\])\[\e[0;1m\]$(__git_ps1) $\[\e[0m\] '

. ~/.bash_local

if [ -z $TMUX ]; then
	export TERM=xterm-256color
else
	export TERM=screen-256color
fi
export LANG=en_US.UTF-8
export EDITOR=vim

which gas 1>/dev/null 2>/dev/null && source ~/dotfiles/bin/gas_complete
