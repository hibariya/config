set history=1000

"full 次のマッチを完全に補完する。最後のマッチの次には元の文字列が使われ、その次は再び最初のマッチが補完される。
"longest 共通する最長の文字列までが補完される。それ以上長い文字列を補完できないときは、次の候補に移る。
"longest:full longest と似ているが、'wildmenu' が有効ならばそれを開始する。
"list 複数のマッチがあるときは、全てのマッチを羅列する。
"list:full 複数のマッチがあるときは、全てのマッチを羅列し、最初のマッチを補完する。
"list:longest 複数のマッチがあるときは、全てのマッチを羅列し、共通する最長の文字列までが補完される。
set wildmode=list:longest

"ファイル名の展開にスラッシュを使う。
set shellslash

"検索で小文字なら大文字を無視、大文字なら無視しない設定。検索パターンが大文字を含んでいたら大文字と小文字を区別して検索。小文字のみの場合は、大文字と小文字を区別しないで検索する。
set smartcase

set iminsert=0
set imsearch=0
set encoding=UTF8
set grepprg=/usr/bin/grep\ -n
let $LANG='c'

"検索結果をハイライトする
set hlsearch
set nrformats-=octal

"インクリメンタルサーチを行う。 検索文字を打っている途中で、目的の単語を見つけたらEnterを押下すればよい。 検索をやめたい場合はEscを押下する。
set incsearch

"入力を開始したらマウスカーソルを隠す。 
set mousehide

"コマンドラインに使われる画面上の行数
set ch=2

set ts=2 sw=2 sts=2

" バックアップを作らない
set nobackup

" 折り返し表示させない
set nowrap

" ブザーをならさない
set noerrorbells

set nu

" 検索時に大文字小文字を区別しない
" set ignorecase

" undoできる回数
set undolevels=1000

" vim からshellを起動するときの
set shell=zsh

" すべてのタブを適当な空白に
set expandtab

set autoindent

" backspaceで改行を云々できる？
set backspace=2

" 検索をファイルの末尾まで検索したら、ファイルの先頭へループする。 
set wrapscan

" 編集中のファイル名をターミナルのタイトルに
set title

" フォント
" set guifont=VL_Gothic:h12:cUTF8

" vi互換モードOFF
set nocompatible

"* manual
"* indent
"* expr
"* marker
"* syntax
"* diff
set foldmethod=marker

"  keybinds
map gg 1G
nnoremap ,a ]f
nnoremap ,n [f
nnoremap ; :
nnoremap <unique> <silent> tab :tabnew<CR>
nnoremap <unique> <silent> tn :tabnext<CR>
nnoremap <unique> <silent> tp :tabprevious<CR>
nnoremap <unique> <silent> fi :Opsplore<CR>
nnoremap <unique> <silent> <space>gre :Grep<space>
nnoremap <unique> <silent> <space>rails :Rails<space>
nnoremap <unique> <silent> <space>rake :Rake<space>
nnoremap <unique> <silent> <space>fb :FufBuffer!<CR>
nnoremap <unique> <silent> <space>ff :FufFile!<CR>
nnoremap <unique> <silent> <space>fm :FufMruFile!<CR>
nnoremap <unique> <silent> <space>fc :FufRenewCache<CR>
nnoremap <unique> <silent> <space>ub :Unite buffer<CR>
nnoremap <unique> <silent> <space>uf :Unite file<CR>
nnoremap <unique> <silent> <space>um :Unite file_mru<CR>
nnoremap <unique> <silent> <space>ur :Unite register<CR>
nnoremap <unique> <silent> <space>u :Unite buffer register file_mru file<CR>
nnoremap <unique> <silent> <space>x :qa<CR>
nnoremap <unique> <silent> <space>xx :qa!<CR>
nnoremap <unique> <silent> <space>c :q<CR>
nnoremap <unique> <silent> <space>cc :q!<CR>

autocmd FileType fuf nmap <C-c> <ESC>
let g:fuf_patternSeparator = ' '
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_mrufile_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'
let g:fuf_mrufile_maxItem = 100
let g:fuf_enumeratingLimit = 20
let g:fuf_file_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'

syntax on
filetype on
filetype indent on
filetype plugin on

"rubycomplete.vim
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1

"  Autocompletion + <TAB>で補完 
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
let g:neocomplcache_max_list = 20
let g:neocomplcache_keyword_completion_start_length = 2 
let g:neocomplcache_min_keyword_length = 2 
let g:neocomplcache_min_syntax_length = 2 
let g:neocomplcache_smart_case = 1 
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'ruby' : $HOME.'/.vim/dict/ruby.dict',
            \ 'php' : $HOME.'/.vim/dict/php.dict'
            \ }

