# oh-my-zsh
source ~/.zsh/oh-my-zsh

# rbenv
export PATH=$HOME/.rbenv/bin:$HOME/bin:$PATH
eval "$(rbenv init -)"
source ~/.rbenv/completions/rbenv.zsh

autoload -U compinit zmv
compinit

unsetopt CORRECT_ALL

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

alias emoji='open http://www.emoji-cheat-sheet.com/'
alias h='history -E -32'
alias ll='ls -laFG'
alias tailf="tail -f"
alias -g L=" | less "
alias -g V=" | vim -R - "
alias info='info --vi-keys'
alias bo='bundle open'
alias be='bundle exec'
alias bu='bundle update'
alias reload='source ~/.zshrc'

function v() { vim `echo $* | gsed -e "s/:\([0-9]\+\)/ +\1/"` }
function e {
 grep --regexp=$1 ~/data/eijiro.utf8.txt | sed -e "s/"$1"/\\x1b[32m\\x1b[1m$(echo $1 | sed -e 's/[\^\$]//g')\\x1b[0m/g" | less
}

source ~/.zshenv

if ! [ $SCREENED = 1 ]; then
  export SCREENDIR=~/.screen/
  export SCREENED=1

  screen -S leaf -qUmc .screen/leaf
fi
