set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Rename'
Plugin 'bling/vim-airline'
Plugin 'cucumber.zip'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'endwise.vim'
Plugin 'fatih/vim-go'
Plugin 'gem.vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'h1mesuke/vim-alignta'
Plugin 'haml.zip'
Plugin 'kana/vim-surround'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-user'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'matchit.zip'
Plugin 'moro/vim-review'
Plugin 'motemen/git-vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mxw/vim-jsx'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'open-browser.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'phildawes/racer'
Plugin 'plasticboy/vim-markdown'
Plugin 'quickrun.vim'
Plugin 'rking/ag.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'

"colorscheme

Plugin 'DarkZen-Color-Scheme'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'Wombat'
Plugin 'Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'desert256.vim'
Plugin 'jellybeans.vim'
Plugin 'molokai'
Plugin 'newspaper.vim'
Plugin 'pyte'
Plugin 'tpope/vim-vividchalk'
Plugin 'twilight'
Plugin 'vim_colors'
Plugin 'xoria256.vim'

call vundle#end()
filetype plugin indent on
syntax enable

set ambiwidth=double
set autoindent
set autoread
set background=dark
set backspace=2
set clipboard+=unnamed
set completeopt=menuone,preview
set cursorline
set directory-=.
set expandtab
set foldmethod=marker
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set mousehide
set nobackup
set nocompatible
set noerrorbells
set number
set shell=zsh
set shiftwidth=2
set showmatch
set smartcase
set t_Co=256
set tabstop=2
set title
set ttymouse=xterm2
set undolevels=1000
set wildmode=list:longest
set wrap
set wrapscan

if !empty(globpath(&rtp, 'colors/vividchalk.vim'))
  colorscheme vividchalk
endif

highlight CursorLine gui=underline

"encoding
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932
set fileformats=unix,dos

" crontab error workaround
set backupskip=/tmp/*,/private/tmp/*"

" highlighting whitespace
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

"自動的に QuickFix リストを表示する
autocmd QuickfixCmdPost make,grep,ggrep,grepadd,vimgrep,vimgrepadd cwin
autocmd QuickfixCmdPost lmake,lgrep,lgrepadd,lvimgrep,lvimgrepadd lwin

" <Leader>
inoremap <Leader>Date <C-R>=strftime('%Y/%m/%d(%a)')<CR>
inoremap <Leader>Time <C-R>=strftime('%H:%M:%S')<CR>

" complement
inoremap <C-f> <C-x><C-o>

" git-vim
let g:git_command_edit = 'rightbelow vnew'

" keybinds
nnoremap <unique> <silent> TN :tabnext<CR>
nnoremap <unique> <silent> TP :tabprevious<CR>
nnoremap <unique> <silent> <space>ta :tabnew<CR>:e .<CR>
nnoremap <unique> <silent> <space>tm :tabm<space>
nnoremap <unique> <silent> <space>fi :NERDTree<CR>
nnoremap <unique> <silent> <space>xx :qa<CR>
nnoremap <unique> <silent> <space>XX :qa!<CR>

cnoremap <C-x> <C-r>=expand('%:p:h')<CR>/

" open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" plasticbody/vim-markdown
let g:vim_markdown_folding_disabled=1

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=darkgrey

" alignta
let g:alignta_default_arguments = '<<0 \ /1'

" airline
let g:airline_theme = 'tomorrow'
let g:airline#extensions#syntastic#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep           = ''
let g:airline_right_sep          = ''
let g:airline_symbols.branch     = '⎇'

" Syntastic
let g:syntastic_javascript_checkers = ['eslint', 'jshint', 'jscs']

" netrw
let g:netrw_liststyle = 3

" racer
set hidden
let g:racer_cmd = "/home/hibariya/.vim/bundle/racer/target/release/racer"
let $RUST_SRC_PATH="/home/hibariya/src/github.com/rust-lang/rust/src/"

" jsx
let g:jsx_ext_required = 0
