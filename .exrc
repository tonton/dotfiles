
" ==================================
" 環境に依存する設定
" ==================================

" backup dir
set backupdir=$HOME/.vim_back
"スワップファイル用のディレクトリ
set directory=$HOME/.vim_swap
"補完辞書ファイルの置き場所
"set dictionary=$HOME/.vim/.vim_dic/vim.dict
"プラグインの置く場所
set runtimepath+=$ROOT/share/vim/vim70/,$HOME/.vim/

"NeoBundle
set nocompatible 

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

"must
NeoBundle 'Shougo/vimproc', {'build':{
            \ 'mac':'make -f make_mac.mak',
            \ 'unix':'make -f make_unix.mak',
            \ },
            \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Lokaltog/vim-powerline'
"NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'eregex.vim'
NeoBundle 'Shougo/unite-ssh'
NeoBundle 'Shougo/unite-help'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'The-NERD-tree'
NeoBundle 'vim-jp/vimdoc-ja' " A project which translate Vim documents into Japanese.
NeoBundle 'pasela/unite-webcolorname' "A unite source plugin which provides Web Color Names
NeoBundle 'mbbill/undotree'
NeoBundle 'kana/vim-submode'
NeoBundle 'thinca/vim-ref'
NeoBundle 'surround.vim'
NeoBundle 'glennhartmann/vim-indent-guides' "Avim plugin for visually displaying indent levels in code
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-commentary'


" debug
NeoBundle 'thinca/vim-quickrun'
"NeoBundle 'vimgdb'
"NeoBundle 'debugger.py'

"git
NeoBundle 'fugitive.vim'
NeoBundle 'kmnk/vim-unite-giti' " unite source for using git

" html
NeoBundle 'mattn/emmet-vim' " emmet for vim: http://emmet.io/
NeoBundle 'othree/html5-syntax.vim' " HTML5 syntax file for vim.
NeoBundle 'hail2u/vim-css3-syntax' " Add CSS3 syntax support to vim's built-in `syntax/css.vim`.
"NeoBundle 'html-improved-indentation'
"NeoBundle 'AtsushiM/sass-compile.vim' " Add Sass compile & utility commands.

" ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'rails.vim'
"NeoBundle 'haml.zip'

" php
NeoBundle 'phpcomplete.vim'
"NeoBundle 'smarty-syntax'
"NeoBundle 'smarty.vim'

" js
NeoBundle 'JavaScript-Indent'
NeoBundle 'pekepeke/titanium-vim'
NeoBundle 'vim-coffee-script'
NeoBundle 'othree/javascript-syntax.vim' " To improve better support for jsdoc-toolkit and upgrade keyword to current standards.
NeoBundle 'jshint.vim' " 0.1   A plugin that integrates JSHint with Vim
NeoBundle 'aurigadl/vim-angularjs' " Configuración para vim, node, javascript, python, sass, angularjs

NeoBundle 'yaml.vim'
NeoBundle 'cocoa.vim'
NeoBundle 'martintreurnicht/vim-gradle' " vundle bundle to enable gradle syntax hightlighting (requires groovy plugin)
NeoBundle 'vim-scripts/groovy.vim' " syntax file for the groovy programming language

" test
NeoBundle 'tpope/vim-surround'
NeoBundle 'cucumber.zip'
NeoBundle 'endwise.vim'
NeoBundle 'vimwiki'
NeoBundle 'vim-remote'
NeoBundle 'newspaper.vim'
NeoBundle 'xoria256.vim'
NeoBundle 'findfuncname.vim'
"NeoBundle 'git://github.com/fifnel/ofaddinbox.vim.git'
NeoBundle 'proc.vim'
NeoBundle 'netrw.vim'
NeoBundle 'Lokaltog/vim-easymotion' " Vim motions on speed!
"NeoBundle 'vim-scripts/ctrlp.vim' " Fuzzy file and buffer finder with regexp support.
"NeoBundle 'vim-scripts/browsereload-mac.vim' " vim plugin to reflesh your browser. his plugin works only MacOS.
NeoBundle 'h1mesuke/vim-alignta'
"NeoBundle 'taskpaper.vim'
"NeoBundle 'Gundo'
"NeoBundle 'NERD_tree-Project'
"NeoBundle 'guicolorscheme.vim'
NeoBundle 'toritori0318/vim-redmine'
NeoBundle 'DoxygenToolkit.vim'
NeoBundle 'java.vim' " 1.0   Convenience mappings for Java programming
NeoBundle 'greplace.vim' " 1.0b1 Replace a pattern across multiple files interactively
:NeoBundle 'airblade/vim-gitgutter' " A Vim plugin which shows a git diff in the gutter (sign column).

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
"nnoremap ,<C-p> :YRShow<CR>
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
let g:undotree_SplitLocation = 'topleft'
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
" ウィンドウサイズの変更キーを簡易化する
" [C-w],[+]または、[C-w],[-]
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')

"------------------------------------
" sass
"------------------------------------
""{{{
"let g:sass_compile_auto = 1
"let g:sass_compile_cdloop = 5
"let g:sass_compile_cssdir = ['css', 'stylesheet']
"let g:sass_compile_file = ['scss', 'sass']
"let g:sass_started_dirs = []
 
autocmd FileType less,sass,html,javascript  setlocal sw=2 sts=2 ts=2 et
"au! BufWritePost * SassCompile
"}}}

"---------------------------------
"   other
"---------------------------------

" move current dir
au BufEnter *   execute ":lcd " . expand("%:p:h")
let g:Powerline_symbols = 'fancy'
" unmatchbracket
set matchpairs+=<:>
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Open junk file."{{{
command! -nargs=0 JunkFile call s:open_junk_file()
function! s:open_junk_file()
    let l:junk_dir = $HOME . '/.vim_junk'. strftime('/%Y/%m')
    if !isdirectory(l:junk_dir)
        call mkdir(l:junk_dir, 'p')
    endif

    let l:filename = input('Junk Code: ', l:junk_dir.strftime('/%Y-%m-%d-%H%M%S.'))
    if l:filename != ''
        execute 'edit ' . l:filename
    endif
endfunction"}}}

"-------------------------------------------------------------------------------
" ステータスライン StatusLine
"-------------------------------------------------------------------------------
set laststatus=2 " 常にステータスラインを表示

"カーソルが何行目の何列目に置かれているかを表示する
set ruler

"let g:Powerline_symbols = 'fancy'

"ステータスラインに文字コードと改行文字を表示する
" if winwidth(0) >= 120
"   set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %{g:HahHah()}\ %F%=[%{GetB()}]\ %{fugitive#statusline()}\ %l,%c%V%8P
" else
"   set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %{g:HahHah()}\ %f%=[%{GetB()}]\ %{fugitive#statusline()}\ %l,%c%V%8P
" endif

"入力モード時、ステータスラインのカラーを変更
" augroup InsertHook
" autocmd!
" autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340 ctermfg=cyan
" autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90 ctermfg=white
" augroup END

"自動的に QuickFix リストを表示する
"autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin
"autocmd QuickfixCmdPost lmake,lgrep,lgrepadd,lvimgrep,lvimgrepadd lwin

"{{{
function! GetB()
    let c = matchstr(getline('.'), '.', col('.') - 1)
    let c = iconv(c, &enc, &fenc)
    return String2Hex(c)
endfunction
" help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
    let n = a:nr
    let r = ""
    while n
        let r = '0123456789ABCDEF'[n % 16] . r
        let n = n / 16
    endwhile
    return r
endfunc
" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
    let out = ''
    let ix = 0
    while ix < strlen(a:str)
        let out = out . Nr2Hex(char2nr(a:str[ix]))
        let ix = ix + 1
    endwhile
    return out
endfunc
" }}}

colorscheme wombat.cui

filetype indent on

if neobundle#exists_not_installed_bundles()
    echomsg 'Not installed bundles : ' .
                \ string(neobundle#get_not_installed_bundle_names())
    echomsg 'Please execute ":NeoBundleInstall" command.'
    "finish
endif
