set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'Command-T'
Bundle 'Rename'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'bling/vim-airline'
Bundle 'cucumber.zip'
Bundle 'endwise.vim'
Bundle 'gem.vim'
Bundle 'h1mesuke/unite-outline'
Bundle 'h1mesuke/vim-alignta'
Bundle 'haml.zip'
Bundle 'kana/vim-surround'
Bundle 'kana/vim-textobj-entire'
Bundle 'kana/vim-textobj-user'
Bundle 'kchmck/vim-coffee-script'
Bundle 'matchit.zip'
Bundle 'moro/vim-review'
Bundle 'motemen/git-vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'neco-look'
Bundle 'open-browser.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'quickrun.vim'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-unimpaired'
Bundle 'tsukkee/unite-help'
Bundle 'tsukkee/unite-tag'
Bundle 'ujihisa/unite-colorscheme'
Bundle 'ujihisa/unite-font'
Bundle 'ujihisa/unite-locate'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vimwiki'
Bundle 'vundle'

"colorscheme

Bundle 'DarkZen-Color-Scheme'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'Wombat'
Bundle 'Zenburn'
Bundle 'altercation/vim-colors-solarized'
Bundle 'molokai'
Bundle 'mrkn256.vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'newspaper.vim'
Bundle 'pyte'
Bundle 'tpope/vim-vividchalk'
Bundle 'twilight'
Bundle 'vim_colors'
Bundle 'xoria256.vim'

filetype plugin indent on
syntax enable

colorscheme vividchalk
highlight CursorLine gui=underline
set ambiwidth=double
set autoindent
set autoread
set background=dark
set backspace=2
set clipboard+=unnamed
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
set nowrap
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
set wrapscan

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

" git-vim
let g:git_command_edit = 'rightbelow vnew'

" keybinds
nnoremap <unique> <silent> TN :tabnext<CR>
nnoremap <unique> <silent> TP :tabprevious<CR>
nnoremap <unique> <silent> <space>ya :YRShow<CR>
nnoremap <unique> <silent> <space>ta :tabnew<CR>:e .<CR>
nnoremap <unique> <silent> <space>tm :tabm<space>
nnoremap <unique> <silent> <space>bu :Unite buffer<CR>
nnoremap <unique> <silent> <space>fi :Unite file<CR>
nnoremap <unique> <silent> <space>mr :Unite file_mru<CR>
nnoremap <unique> <silent> <space>re :Unite register<CR>
nnoremap <unique> <silent> <space>ou :Unite outline<CR>
nnoremap <unique> <silent> <space>lo :Unite locate<CR>
nnoremap <unique> <silent> <space>co :Unite colorscheme<CR>
nnoremap <unique> <silent> <space>un :Unite buffer tab window register file_mru directory_mru file bookmark<CR>
nnoremap <unique> <silent> <space>xx :qa<CR>
nnoremap <unique> <silent> <space>XX :qa!<CR>
nnoremap <unique> <silent> <Left>  :tabprevious <CR>
nnoremap <unique> <silent> <Right> :tabnext <CR>
nnoremap <unique> <silent> <Up>  :bprevious <CR>
nnoremap <unique> <silent> <Down> :bnext <CR>

cnoremap <C-x> <C-r>=expand('%:p:h')<CR>/

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 10
let g:neocomplcache_max_keyword_width = 30
let g:neocomplcache_enable_wildcard = 1
let g:neocomplcache_enable_smart_case = 1

" workaround: Option 'omnifunc' is not set
"setlocal omnifunc=syntaxcomplete#Complete

" open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" plasticbody/vim-markdown
let g:vim_markdown_folding_disabled=1

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=1
let g:indent_guides_auto_colors=1
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" vimwiki
let g:vimwiki_list = [{'path': '~/d/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]

" alignta
let g:alignta_default_arguments = '<<0 \ /1'

" airline
let g:airline_theme = 'bubblegum'
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep           = '»'
let g:airline_left_sep           = '▶'
let g:airline_right_sep          = '«'
let g:airline_right_sep          = '◀'
let g:airline_symbols.linenr     = '␊'
let g:airline_symbols.linenr     = '␤'
let g:airline_symbols.linenr     = '¶'
let g:airline_symbols.branch     = '⎇'
let g:airline_symbols.paste      = 'ρ'
let g:airline_symbols.paste      = 'Þ'
let g:airline_symbols.paste      = '∥'
let g:airline_symbols.whitespace = 'Ξ'
