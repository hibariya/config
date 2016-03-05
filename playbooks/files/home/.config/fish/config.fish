set PATH $HOME/bin $HOME/src/bin $PATH

set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1
source ~/.rbenv/completions/rbenv.fish

set PATH $HOME/.nodebrew/current/bin $PATH

set PATH $HOME/.cargo/bin $PATH

set GOPATH $HOME

eval (direnv hook fish)

ssh-add ~/.ssh/id_dsa

function g
  git $argv
end

function be
  bundle exec $argv
end

function ll
  ls -lh $argv
end

function e
  echo $argv | sed -e 's/[\^\$]//g' | read word
  grep --regexp=$argv ~/data/eijiro.utf8.txt | sed -e "s/$argv/\\x1b[36m\\x1b[1m$word\\x1b[0m/g" | eval $PAGER
end

function repo
  ghq list -p | peco | read there
  cd $there
end

function vimr
  git ls-files | xargs ls -At | peco | read that
  vim $that
end
