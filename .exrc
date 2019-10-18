
" ==================================
" 環境に依存する設定
" ==================================
set backupdir=$HOME/.vim_back
set directory=$HOME/.vim_swap

" ==================================
" plugins
" ==================================
if &compatible
    set nocompatible
endif

" Required:
set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state($HOME.'/.vim/dein')
    call dein#begin($HOME.'/.vim/dein')

    " Required:
    call dein#add($HOME.'/.vim/dein/repos/github.com/Shougo/dein.vim')

    " Add or remove your plugins here:
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/unite.vim')
    call dein#add('Shougo/unite-outline')
    call dein#add('Shougo/neomru.vim')
    call dein#add('Shougo/neocomplcache')
    call dein#add('Shougo/neosnippet')
    call dein#add('tpope/vim-surround')
    call dein#add('Shougo/vimfiler')
    call dein#add('Shougo/vimshell')
    call dein#add('Lokaltog/vim-powerline')
    call dein#add('vim-scripts/YankRing.vim')
    call dein#add('othree/eregex.vim')
    call dein#add('Shougo/unite-ssh')
    call dein#add('Shougo/unite-help')
    call dein#add('scrooloose/syntastic.git')
    call dein#add('vim-jp/vimdoc-ja') " A project which translate Vim documents into Japanese.
    call dein#add('pasela/unite-webcolorname') "A unite source plugin which provides Web Color Names
    call dein#add('mbbill/undotree')
    call dein#add('kana/vim-submode')
    call dein#add('thinca/vim-ref')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('tpope/vim-commentary')
    call dein#add('Shougo/junkfile.vim') " Create temporary file for memo, testing, ...
    call dein#add('previm/previm')

    " debug
    call dein#add('thinca/vim-quickrun')
    "dein#add('vimgdb')
    "dein#add('debugger.py')

    " git
    call dein#add('tpope/vim-fugitive')
    call dein#add('kmnk/vim-unite-giti') " unite source for using git
    call dein#add('airblade/vim-gitgutter')

    " html
    call dein#add('mattn/emmet-vim') " emmet for vim: http://emmet.io/
    call dein#add('othree/html5-syntax.vim') " HTML5 syntax file for vim.
    call dein#add('hail2u/vim-css3-syntax') " Add CSS3 syntax support to vim's built-in `syntax/css.vim`.
    call dein#add('vim-scripts/vim-stylus') " Syntax/Indentation for Stylus

    " ruby
    call dein#add('vim-ruby/vim-ruby')

    " markdown
    call dein#add('plasticboy/vim-markdown')

    " js
    call dein#add('othree/yajs.vim')
    call dein#add('leafgarland/typescript-vim')
    call dein#add('posva/vim-vue')
    call dein#add('MaxMEllon/vim-jsx-pretty')

    call dein#add('martintreurnicht/vim-gradle') " vundle bundle to enable gradle syntax hightlighting (requires groovy plugin)
    call dein#add('vim-scripts/groovy.vim') " syntax file for the groovy programming language
    "call dein#add('hunner/vim-puppet') " The vim syntax files for Puppet. Useful for Vundle

    " Required:
    call dein#end()
    call dein#save_state()
endif


" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

"---------------------------------
"   zencoding.vim
"---------------------------------
let g:user_zen_leader_key = '<Leader>z'
let g:user_zen_expandabbr_key = '<Leader>z'

"---------------------------------
"   Align.vim
"---------------------------------
vmap ,=  \tsp
let g:Align_xstrlen = 3

"---------------------------------
"   yankling.vim
"---------------------------------
"let g:yankring_history_dir=$HOME . '/.vim/cache/'
if exists('$TMUX')
    "set clipboard+=unnamedplus,unnamed
    set clipboard=
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    set clipboard=
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


"---------------------------------
"   vim-ref
"---------------------------------
let g:ref_cache_dir=$HOME .'/.vim/cache/'
let g:ref_open="split"

"--- alc 
"let g:ref_alc_use_cache=1
let g:ref_alc_cmd='lynx -dump -nonumbers %s'
let g:ref_alc_encoding = 'UTF-8'
vnoremap ,d :call ref#jump('visual', 'alc')<CR>

"--- php manual
"let g:ref_phpmanual_path = $HOME . '/.vim/refdoc/php-chunked-xhtml/'
"let g:ref_phpmanual_cmd = 'w3m -dump %s'

"---------------------------------
"   taskpaper.vim
"---------------------------------
"map  <buffer><silent> td <Plug>ToggleDone
"map  <buffer><silent> tc <Plug>ShowContext
"map  <buffer><silent> ta <Plug>ShowAll
"map  <buffer><silent> tp <Plug>FoldAllProjects

"---------------------------------
"   vimshell.vim
"---------------------------------

"---------------------------------
"   prittyprint.vim
"---------------------------------
"command! -nargs=+ Vars PP filter(copy(g:), 'v:key =~# "^<args>"')

"---------------------------------
"   neocompletecache.vim
"---------------------------------
"let g:neocomplcache_enable_at_startup = 1 
"let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'
"imap <C-k>  <Plug>(neocomplcache_start_unite_complete)
"imap <C-l>  <Plug>(neocomplcache_snippets_expand)

"---------------------------------
"   unite.vim
"---------------------------------
let g:unite_data_directory=$HOME . '/.vim/srcfiles/'
let g:unite_split_rule='botright'
"let g:unite_enable_start_insert=1
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0


nmap <Leader>f :Unite file file/new<CR>
nmap <Leader>b :Unite buffer file_mru <CR>
nmap <Leader>v :UniteWithCursorWord  buffer file_mru<CR>
nmap <Leader>o :Unite outline <CR>
nmap <Leader>g :Unite giti <CR>
nmap <Leader>k :Unite bookmark <CR>
nmap <Leader>a :UniteAddBookmark 
nmap <Leader>e :VimFilerCurrentDir <CR>
nmap <Leader>q :QuickRun <CR>
nmap <Leader>p :YRShow<CR>

"---------------------------------
"   gundo
"---------------------------------
nmap <Leader>u :GundoToggle<CR>

"---------------------------------
"   vim-task
"---------------------------------
map <silent> <buffer> td <ESC>:call Toggle_task_status()<CR>i

"---------------------------------
"   NERD_TREE
"---------------------------------
nmap <Leader>t :NERDTreeToggle<CR>

"---------------------------------
"   eregex
"---------------------------------
nnoremap <F6>  :%S/
inoremap <F6>  <ESC>:%S/

"---------------------------------
"   quickrun
"---------------------------------
let g:quickrun_config = {
            \   'objc': {
            \     'command': 'cc',
            \     'exec': ['%c %s -o %s:p:r -framework Foundation', '%s:p:r %a', 'rm -f %s:p:r'],
            \     'tempfile': '{tempname()}.m',
            \   },
            \   'gradle': {
            \     'command': 'gradle',
            \     'exec' :['gradle test']
            \   }
            \ }

"---------------------------------
" indent guide
"---------------------------------
"{{{
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=darkgray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=gray
" ガイドの幅
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level= 2
"}}}

"---------------------------------
" undotree
"---------------------------------
"{{{
nmap <Leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_SplitWidth = 35
let g:undotree_diffAutoOpen = 1
let g:undotree_diffpanelHeight = 25
let g:undotree_RelativeTimestamp = 1
let g:undotree_TreeNodeShape = '*'
let g:undotree_HighlightChangedText = 1
let g:undotree_HighlightSyntax = "UnderLined"
" }}}

" submode.vim
" http://d.hatena.ne.jp/thinca/20130131/1359567419
" ウィンドウサイズの変set 更キーを簡易化する
" [C-w],[+]または、[C-w],[-]
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')

"---------------------------------
"   markdown
"---------------------------------
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
autocmd Filetype markdown nmap <buffer><silent><Leader>r :PrevimOpen<CR>
let g:previm_open_cmd = 'open -a Google\ Chrome'


"---------------------------------
" typescript
"---------------------------------
autocmd BufNewFile,BufRead *.{ts,tsx} set filetype=typescript

"---------------------------------
"   other
"---------------------------------

" move current dir
au BufEnter *   execute ":lcd " . expand("%:p:h")
let g:Powerline_symbols = 'fancy'
" unmatchbracket
set matchpairs+=<:>
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
autocmd FileType less,sass,html,javascript  setlocal sw=2 sts=2 ts=2 et


"-------------------------------------------------------------------------------
" ステータスライン StatusLine
"-------------------------------------------------------------------------------
set laststatus=2 " 常にステータスラインを表示

"カーソルが何行目の何列目に置かれているかを表示する
set ruler


"自動的に QuickFix リストを表示する
"autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin
"autocmd QuickfixCmdPost lmake,lgrep,lgrepadd,lvimgrep,lvimgrepadd lwin

colorscheme wombat.cui
filetype plugin indent on
syntax enable
