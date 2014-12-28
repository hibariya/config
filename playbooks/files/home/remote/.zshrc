# oh-my-zsh
source ~/.zsh/oh-my-zsh

# rbenv
export PATH=$HOME/.rbenv/bin:$HOME/bin:$PATH
eval "$(rbenv init -)"
source ~/.rbenv/completions/rbenv.zsh

autoload -U compinit
compinit

unsetopt CORRECT_ALL

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

alias h='history -E -32'
alias ll='ls -laFG'
alias tailf="tail -f"
alias -g L=" | less "
alias -g V=" | vim -R - "
alias info='info --vi-keys'
alias bo='bundle open'
alias be='bundle exec'
alias bu='bundle update'

source ~/.zshenv
