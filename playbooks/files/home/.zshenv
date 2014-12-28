export PATH=$HOME/local/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:.:$PATH
export EDITOR=vim
export MANPATH=/opt/local/man:$MANPATH
#export LC_ALL=ja_JP.UTF-8

export TERM=screen-256color
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export SHELL=zsh

# 補完リストが多いときに尋ねる数
# -1 : 尋ねない
#  0 : ウィンドウから溢れるときは尋ねる
export LISTMAX=0

export ARCHFLAGS="-arch x86_64"
export MAKEOPTS="-j5"

export PGDATA=/usr/local/var/postgres

export RETTER_HOME=$HOME/d/projects/github/hibariya.github.com

export RUBYOPT=""

export BROWSER=google-chrome

alias emoji='gnome-open http://www.emoji-cheat-sheet.com/'

alias wkhtmltopdf=/usr/bin/wkhtmltopdf # workaround for wkhtmltopdf gem