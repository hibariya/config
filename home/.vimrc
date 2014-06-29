set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'Rename'
Plugin 'Shougo/neocomplcache'
Plugin 'Shougo/unite.vim'
Plugin 'bling/vim-airline'
Plugin 'cucumber.zip'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'endwise.vim'
Plugin 'gem.vim'
Plugin 'h1mesuke/unite-outline'
Plugin 'h1mesuke/vim-alignta'
Plugin 'haml.zip'
Plugin 'kana/vim-surround'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-user'
Plugin 'kchmck/vim-coffee-script'
Plugin 'matchit.zip'
Plugin 'moro/vim-review'
Plugin 'motemen/git-vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'neco-look'
Plugin 'scrooloose/nerdtree'
Plugin 'open-browser.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'quickrun.vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-unimpaired'
Plugin 'tsukkee/unite-help'
Plugin 'tsukkee/unite-tag'
Plugin 'ujihisa/unite-colorscheme'
Plugin 'ujihisa/unite-font'
Plugin 'ujihisa/unite-locate'
Plugin 'vim-ruby/vim-ruby'
"Plugin 'vimwiki'

"colorscheme

Plugin 'DarkZen-Color-Scheme'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'Wombat'
Plugin 'Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'desert256.vim'
Plugin 'jellybeans.vim'
Plugin 'molokai'
Plugin 'mrkn256.vim'
Plugin 'newspaper.vim'
Plugin 'pyte'
Plugin 'tpope/vim-vividchalk'
Plugin 'twilight'
Plugin 'vim_colors'
Plugin 'xoria256.vim'

call vundle#end()
filetype plugin indent on
syntax enable

set t_Co=256
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
set tabstop=2
set title
set ttymouse=xterm2
set undolevels=1000
set wildmode=list:longest
set wrapscan
colorscheme vividchalk
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

" git-vim
let g:git_command_edit = 'rightbelow vnew'

" keybinds
nnoremap <unique> <silent> TN :tabnext<CR>
nnoremap <unique> <silent> TP :tabprevious<CR>
nnoremap <unique> <silent> <space>ya :YRShow<CR>
nnoremap <unique> <silent> <space>ta :tabnew<CR>:e .<CR>
nnoremap <unique> <silent> <space>tm :tabm<space>
nnoremap <unique> <silent> <space>fi :NERDTree<CR>
nnoremap <unique> <silent> <space>Fi :Unite file<CR>
nnoremap <unique> <silent> <space>bu :Unite buffer<CR>
nnoremap <unique> <silent> <space>re :Unite register<CR>
nnoremap <unique> <silent> <space>ou :Unite outline<CR>
nnoremap <unique> <silent> <space>co :Unite colorscheme<CR>
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
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=darkgrey

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

function! PlaySound(path)
  call system('aplay ~/d/sounds/' . a:path . ' &')
endfunction

autocmd BufRead         * call PlaySound('yumenikki/エフェクト使用.WAV')
autocmd BufEnter        * call PlaySound('yumenikki/SUZU.WAV')
autocmd BufWritePost    * call PlaySound('yumenikki/カラリロロ.WAV')
autocmd CmdwinEnter     * call PlaySound('yumenikki/インフォ音.WAV')
autocmd ColorScheme     * call PlaySound('yumenikki/Sbend.WAV')
autocmd CompleteDone    * call PlaySound('yumenikki/決定音.WAV')
autocmd CursorHold      * call PlaySound('yumenikki/エフェクト解除.WAV')
autocmd CursorMoved     * call PlaySound('yumenikki/足音_008.wav') " PlaySound('yumenikki/足音_012.WAV'), PlaySound('yumenikki/足音_013.WAV')
autocmd CursorMovedI    * call PlaySound('yumenikki/足音_007.WAV') " PlaySound('yumenikki/足音_001.wav')
autocmd InsertEnter     * call PlaySound("yumenikki/青.WAV")
autocmd InsertLeave     * call PlaySound("yumenikki/赤.WAV")
autocmd QuickFixCmdPre  * call PlaySound('yumenikki/ＧＥＴ音１.WAV')
autocmd ShellCmdPost    * call PlaySound('yumenikki/キャー１.WAV')
autocmd SwapExists      * call PlaySound('yumenikki/ブザー１.WAV')
autocmd VimEnter        * call PlaySound('yumenikki/エコーベル１.WAV')
autocmd VimLeave        * call PlaySound('yumenikki/頬をつねる.WAV')
autocmd EncodingChanged * call PlaySound('yumenikki/ＧＥＴ音１.WAV')
autocmd VimResized      * call PlaySound('yumenikki/幽霊.WAV')
