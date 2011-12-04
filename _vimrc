set rtp+=~/.vim/vundle.git/
call vundle#rc()

Bundle 'opsplorer'
Bundle 'endwise.vim'
Bundle 'haml.zip'
Bundle 'git-commit'
Bundle 'rails.vim'
Bundle 'YankRing.vim'
Bundle 'newspaper.vim'
Bundle 'xoria256.vim'
Bundle 'mrkn256.vim'
Bundle 'quickrun.vim'
Bundle 'vimwiki'
Bundle 'open-browser.vim'
"Bundle 'git://github.com/t9md/vim-textmanip.git' "動かぬ
Bundle 'git://github.com/tpope/vim-markdown.git'
Bundle 'neco-look'

"Bundle 'surround.vim' "vim-reviewのためにvim-surroundを使う
Bundle 'git://github.com/kana/vim-surround.git'

Bundle 'git://github.com/vim-ruby/vim-ruby.git'
Bundle 'git://github.com/motemen/git-vim.git'
Bundle 'git://github.com/tpope/vim-fugitive.git'
Bundle 'git://github.com/Shougo/neocomplcache.git'
Bundle 'git://github.com/h1mesuke/vim-alignta.git'

Bundle 'git://github.com/Shougo/unite.vim.git'
Bundle 'git://github.com/ujihisa/unite-colorscheme.git'
Bundle 'git://github.com/h1mesuke/unite-outline.git'
Bundle 'git://github.com/ujihisa/unite-font.git'
Bundle 'https://github.com/ujihisa/unite-locate.git'
Bundle 'git://github.com/tsukkee/unite-help.git'

"Bundle 'git://github.com/Shougo/vimproc.git'
"Bundle 'git://github.com/Shougo/vimshell.git'

Bundle 'matchit.zip'
"Bundle 'git://github.com/motemen/hatena-vim.git'
Bundle 'cucumber.zip'
Bundle 'git://github.com/kchmck/vim-coffee-script.git'
Bundle 'Command-T'

Bundle 'git://github.com/moro/vim-review.git'

filetype on
filetype indent on
filetype plugin on
syntax on

set t_Co=256
set background=dark
colorscheme desert
"let g:colors_name = "xoria256"
"let g:colors_name = "newspaper"

set ambiwidth=double
set autoread
set hidden
set number
set showmatch
set ttymouse=xterm2
set wildmode=longest:list
set nocompatible

set directory-=.

"backup
set nobackup

"encoding
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932
set fileformats=unix,dos

" Tab
"set expandtab
set smartindent
set ts=2 sw=2 sts=2

"statusline
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%=%l,%c%v%8p

"自動的に QuickFix リストを表示する
autocmd QuickfixCmdPost make,grep,ggrep,grepadd,vimgrep,vimgrepadd cwin
autocmd QuickfixCmdPost lmake,lgrep,lgrepadd,lvimgrep,lvimgrepadd lwin

" clipboard
set clipboard+=unnamed

" <Leader>
inoremap <Leader>date <C-R>=strftime('%Y/%m/%d(%a)')<CR>
inoremap <Leader>time <C-R>=strftime('%H:%M:%S')<CR>

" git-commit.vim
let git_diff_spawn_mode = 1

" git-vim
let g:git_command_edit = 'rightbelow vnew'

"set grepprg=internal
set history=1000
set wildmode=list:longest
set hlsearch
set nrformats-=octal
set incsearch
set mousehide
set nowrap
set noerrorbells
set ignorecase
set undolevels=1000
set shell=zsh
set expandtab
set autoindent
set backspace=2
set wrapscan
set title
set foldmethod=marker
set cursorline
highlight CursorLine gui=underline

" keybinds
nnoremap ; :
nnoremap <unique> <silent> tab :tabnew<CR>
nnoremap <unique> <silent> tn :tabnext<CR>
nnoremap <unique> <silent> tp :tabprevious<CR>
nnoremap <unique> <silent> tf :tabfirst<CR>
nnoremap <unique> <silent> tl :tablast<CR>
nnoremap <unique> <silent> fi :Opsplore<CR>
nnoremap <unique> <silent> ya :YRShow<CR>
nnoremap <unique> <silent> <space>tm :tabm<space>
nnoremap <unique> <silent> <space>ub :Unite buffer<CR>
nnoremap <unique> <silent> <space>uf :Unite file<CR>
nnoremap <unique> <silent> <space>um :Unite file_mru<CR>
nnoremap <unique> <silent> <space>ur :Unite register<CR>
nnoremap <unique> <silent> <space>uo :Unite outline<CR>
nnoremap <unique> <silent> <space>ul :Unite locate<CR>
nnoremap <unique> <silent> <space>uc :Unite colorscheme<CR>
nnoremap <unique> <silent> <space>ui :Unite buffer tab window register file_mru directory_mru file bookmark<CR>
nnoremap <unique> <silent> <space>xx :qa<CR>
nnoremap <unique> <silent> <space>qq :q<CR>

" Autocompletion + <TAB>で補完
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<TAB>"
  else
    if pumvisible()
      return "\<C-N>"
    else
      return "\<C-N>\<C-P>"
    end
  endif
endfunction
" Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"  Autocompletion using the TAB key

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 10
let g:neocomplcache_max_keyword_width = 30
let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_manual_completion_start_length = 3
let g:neocomplcache_min_keyword_length = 4
let g:neocomplcache_min_syntax_length = 4
let g:neocomplcache_enable_wildcard = 0
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'ruby' : $HOME.'/.vim/dict/ruby.dict',
            \ 'php' : $HOME.'/.vim/dict/php.dict'
            \ }

" workaround: Option 'omnifunc' is not set
setlocal omnifunc=syntaxcomplete#Complete

highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" for Hatena.vim
":let g:hatena_user='hibariya'

" Align.vim
:let g:Align_xstrlen = 3

" YankRing.vim
let g:yankring_zap_keys = 'horrible!'

" open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" crontab error workaround
set backupskip=/tmp/*,/private/tmp/*"
