set -x PATH $HOME/bin $HOME/src/bin $PATH

set -x PATH $HOME/.rbenv/bin $PATH
set -x PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1
source ~/.rbenv/completions/rbenv.fish

set -x PATH $HOME/.nodebrew/current/bin $PATH
source ~/.nodebrew/completions/fish/nodebrew.fish

set -x PATH $HOME/.cargo/bin $PATH

set -x GOPATH $HOME

eval (direnv hook fish)

abbr -a be='bundle exec'
abbr -a g='git'
abbr -a ll='ls -lh'
abbr -a cta='ctags -R (git ls-files)'
abbr -a hr='hub browse'

function e
  echo $argv | sed -e 's/[\^\$]//g' | read word
  grep --regexp=$argv ~/data/eijiro.utf8.txt | sed -e "s/$argv/\\x1b[36m\\x1b[1m$word\\x1b[0m/g" | eval $PAGER
end

function peco_select_history
  if set -q $argv
    history | peco | read cmd
  else
    history | peco --query $argv | read cmd
  end

  commandline $cmd
end

function repo
  ghq list -p | peco | read there
  cd $there
end

function vimr
  git ls-files | xargs ls -At | peco | read that
  vim $that
end

function fish_user_key_bindings
  bind \cr peco_select_history
end

set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish
