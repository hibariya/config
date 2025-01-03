alias ll="ls -alh"

export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth

shopt -s histappend

export PS1="\e[0;33m[\u@\h \w \t $?]\$ \e[m"
