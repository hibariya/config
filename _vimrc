set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'bling/vim-airline'
Bundle 'rking/ag.vim'
Bundle 'Command-T'
Bundle 'Rename'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'VimClojure'
Bundle 'YankRing.vim'
Bundle 'cucumber.zip'
Bundle 'endwise.vim'
Bundle 'git-commit'
Bundle 'h1mesuke/unite-outline'
Bundle 'h1mesuke/vim-alignta'
Bundle 'haml.zip'
"Bundle 'surround.vim' vim-reviewのためにvim-surroundを使う
Bundle 'kana/vim-surround'
Bundle 'kchmck/vim-coffee-script'
Bundle 'matchit.zip'
Bundle 'moro/vim-review'
Bundle 'motemen/git-vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'neco-look'
Bundle 'open-browser.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'quickrun.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tsukkee/unite-help'
Bundle 'tsukkee/unite-tag'
Bundle 'ujihisa/unite-colorscheme'
Bundle 'ujihisa/unite-font'
Bundle 'ujihisa/unite-locate'
Bundle 'vim-ruby/vim-ruby'
"Bundle 'vimwiki'
Bundle 'vundle'

" colorschemes
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

set t_Co=256
set background=dark
colorscheme vividchalk

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

"statusline
set laststatus=2

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
set tabstop=2
set shiftwidth=2
set wrapscan
set title
set foldmethod=marker
set cursorline
highlight CursorLine gui=underline

" keybinds
nnoremap ; :
nnoremap <unique> <silent> Tab :tabnew<CR>
nnoremap <unique> <silent> Tn :tabnext<CR>
nnoremap <unique> <silent> TN :tabnext<CR>
nnoremap <unique> <silent> Tp :tabprevious<CR>
nnoremap <unique> <silent> TP :tabprevious<CR>
nnoremap <unique> <silent> Ya :YRShow<CR>
nnoremap <unique> <silent> <space>ta :tabnew<CR>:e .<CR>
nnoremap <unique> <silent> <space>tm :tabm<space>
nnoremap <unique> <silent> <space>u<space> :Unite<space>
nnoremap <unique> <silent> <space>ub :Unite buffer<CR>
nnoremap <unique> <silent> <space>uf :Unite file<CR>
nnoremap <unique> <silent> <space>um :Unite file_mru<CR>
nnoremap <unique> <silent> <space>ur :Unite register<CR>
nnoremap <unique> <silent> <space>uo :Unite outline<CR>
nnoremap <unique> <silent> <space>ul :Unite locate<CR>
nnoremap <unique> <silent> <space>uc :Unite colorscheme<CR>
nnoremap <unique> <silent> <space>ui :Unite buffer tab window register file_mru directory_mru file bookmark<CR>
nnoremap <unique> <silent> <space>xx :qa<CR>
nnoremap <unique> <silent> <space>fi :Unite file<CR>

cnoremap <C-x> <C-r>=expand('%:p:h')<CR>/

au FileType unite nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-o> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')

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

" Align.vim
:let g:Align_xstrlen = 3

" open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" crontab error workaround
set backupskip=/tmp/*,/private/tmp/*"

" plasticbody/vim-markdown
let g:vim_markdown_folding_disabled=1

" vim-indent-guides
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2

highlight IndentGuidesOdd  ctermbg=darkgray
highlight IndentGuidesEven ctermbg=darkcyan

" vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]

" airline
let g:airline_theme = 'bubblegum'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
