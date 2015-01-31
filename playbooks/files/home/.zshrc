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
alias info='info --vi-keys'
alias be='bundle exec'

alias -g L=" | less "
alias -g V=" | vim -R - "
alias -g R='$(
  git status -s > /dev/null 2>&1

  if [ $? -eq 0 ]
  then
    git ls-files | xargs ls -At | head | peco
  else
    ls -At **/*.*               | head | peco
  fi
)'

function e {
  w=${@/\ /\\ }
  grep --regexp=$w ~/data/eijiro.utf8.txt | sed -e "s/"$w"/\\x1b[36m\\x1b[1m$(echo $w | sed -e 's/[\^\$]//g')\\x1b[0m/g" | $PAGER
}

source ~/.zshenv

if ! [ $SCREENED = 1 ]; then
  export SCREENDIR=~/.screen/
  export SCREENED=1

  screen -S leaf -qUmc .screen/leaf
fi

# added by travis gem
[ -f /home/hibariya/.travis/travis.sh ] && source /home/hibariya/.travis/travis.sh
