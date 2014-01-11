export LS_COLORS="di=01;34"
PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'
PS1='\[\e]0;\w\a\]\[\e[1m\]\u@\h\[\e[0m\]\[\e[1;38;5;52m\](\[\e[0m\]\w\[\e[1;38;5;52m\])\[\e[0;1m\] ⚡\[\e[0m\] '

. ~/.bash_local

export TERM=xterm-256color
export LANG=en_US.UTF-8
export EDITOR=vim
