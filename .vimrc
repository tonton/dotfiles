
set nonumber
"バックスペースキーを有効
"set backspace=2
"現在のモードを表示
set showmode
"色分け表示
syntax on
"検索結果ハイライト
set hlsearch
"新しい行のインデントを現在行と同じにする
set autoindent
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer
"クリップボードを連携
set clipboard+=unnamed
"Vi互換をオフ
set nocompatible
"タブの代わりに空白文字を挿入する
set expandtab
"ファイル内の <Tab> が対応する空白の数
set tabstop=2   
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set shiftwidth=2
set smarttab
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
"タブ文字、行末など不可視文字を表示する
set list
"listで表示される文字のフォーマットを指定する
set listchars=tab:>-,extends:<,eol:~
highlight SpecialKey term=underline ctermfg=darkgray guifg=darkgray
"折りたたみ有効
set fdm=marker
"バッファ編集可能
set modifiable
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない
set nowrapscan
"コマンド補完
set nocompatible
"increment 10進数
set nf=""
"補完
set wildmode=longest,list,full
" 先頭が0でも10進数
set nrformats-=octal
"bellを鳴らさない
set noerrorbells
set vb t_vb=
"カーソル位置の表示
"set ruler
"set rulerformat=%55(%{strftime('%b\%e\%a\ %k:%M\ ')}\ %5l,%-6(%c%V%)\ %P%)
"set laststatus=2
"set statusline=%t\ %m%r%h%w[%Y][%{&fenc}]%=%c,%l\ %P\ %{strftime('%k:%M')}
"全角スペースを可視化
highlight ZenkakuSpace cterm=underline ctermfg=blue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

filetype plugin on

"補完: omni
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

"---------------------------------
" 日本語設定
"---------------------------------
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,latin1
set fenc=utf-8
set enc=utf-8
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

"---------------------------------
" key maps
"---------------------------------
nnoremap <ESC><ESC> :noh<CR>
nnoremap <SPACE> i<SPACE><ESC>
nnoremap <F12>       :set number!<CR>
inoremap <F12>       <ESC>:set number!<CR>a
nnoremap <F11>       :set list!<CR>
inoremap <F11>       <ESC>:set list!<CR>a
nnoremap <F10>       :%foldclose<CR>
inoremap <F10>       <ESC>:%foldclose<CR>a
"nnoremap <F5>        :up<CR>
"inoremap <F5>        <ESC>:up<CR>
nnoremap <UP>        g<UP>
nnoremap <DOWN>      g<DOWN>
inoremap <UP>        <ESC>g<UP>a
inoremap <DOWN>      <ESC>g<DOWN>a
inoremap <C-n>       <C-x><C-k>
nnoremap <C-c>       i
nnoremap j    gj
nnoremap k    gk
nnoremap <C-j> <C-^>

"---------------------------------
" Tabs
"---------------------------------
" 0:表示しない 1:複数あるときのみ表示 2:常に表示
set showtabline=2
" tabのバッファ番号を表示
set tabline=%!MyTabLine()
function MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
if i + 1 == tabpagenr()
    let s .= '%#TabLineSel#'
    else
    let s .= '%#TabLine#'
    endif
    let s .= '%' . (i+1) . 'T' 
    let s .= ' ' . (i+1) . (1==getwinvar(i+1,'&modified')?'[+]':'') . ' %{MyTabLabel(' . (i+1) . ')} '
    endfor
    let s .= '%#TabLineFill#%T'
    if tabpagenr('$') > 1 
    let s .= '%=%#TabLine#%999Xclose'
    endif
    return s
    endfunction
    function MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
return bufname(buflist[winnr - 1]) 
    endfunction
"nnoremap ,f       <ESC>:tabf<SPACE>
"nnoremap <tab>    <ESC>:tabp<CR>
"nnoremap <s-tab>  <ESC>:tabn<CR>

" カレントファイルの文字コードを変更する
map <F7>e <ESC>:set fileencoding=euc-jp<CR>
map <F7>s <ESC>:set fileencoding=cp932<CR>
map <F7>u <ESC>:set fileencoding=utf8<CR>
" カレントファイルを指定文字コードで読み直す
map <F8>e <ESC>:e ++enc=euc-jp<CR>
map <F8>s <ESC>:e ++enc=cp932<CR>
map <F8>u <ESC>:e ++enc=utf8<CR>

" マウス有効無効設定
map <F2> <ESC>:set mouse=a<CR>
map <F3> <ESC>:set mouse=<CR>

source  ~/.exrc
