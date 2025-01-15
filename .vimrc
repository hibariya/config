" References
" - https://github.com/mhinz/vim-galore/blob/master/static/minimal-vimrc.vim
" - https://github.com/mhinz/vim-galore#temporary-files

set nocompatible " vim not vi

filetype plugin indent on
syntax on

set autoindent
set expandtab " Spaces instead of tabs
set softtabstop=2
set shiftwidth=2 " >> indents
set shiftround " Make >> indents a bit smarter and round spaces to even numbers considering the existing spaces

set backspace=indent,eol,start " Make backspaces work nicely

set synmaxcol=200 " Only highlight first 200 chars

" Make extra whitespaces visible
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

set number
set nowrap

set hidden " Switch buffers w/o having to save first
set laststatus=2
set display=lastline
set report=0
set showmode
set showcmd

set cursorline " Draw underline at cursor
set mouse=a

set hlsearch " Highlight
set incsearch " Start searching before hitting enter
set wrapscan " Return to the first match after the end

set ignorecase
set smartcase

set ttyfast " Render faster
set lazyredraw

" Put all temporary files under the same directory.
call system('mkdir -p ~/.vim/files/backup ~/.vim/files/swap ~/.vim/files/undo ~/.vim/files/info')
set backup
set backupdir=$HOME/.vim/files/backup/
set backupext=-vimbackup
set backupskip=
set directory=$HOME/.vim/files/swap/
set updatecount=100 " Update the swap file every 100 chars typed
set undofile
set undodir=$HOME/.vim/files/undo/
set viminfo+=n$HOME/.vim/files/info/viminfo

