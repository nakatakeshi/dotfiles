" basic config {{{


if has('vim_starting')
  set nocompatible               " be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"NeoBundle 'Shougo/vimproc' " make at local
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
" NeoBundle 'hallettj/jslint.vim'
NeoBundle 'tyru/operator-camelize.vim'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'vim-scripts/yanktmp.vim'
NeoBundle 'vim-scripts/Align'
NeoBundle 'vimtaku/vim-textobj-sigil'
NeoBundle 't9md/vim-unite-ack'
NeoBundle 'h1mesuke/textobj-wiw'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'nakatakeshi/.vim'
NeoBundle 'nakatakeshi/jump2pm.vim'
NeoBundle 'nakatakeshi/show_github_url.vim'
NeoBundle 'nakatakeshi/perl_file_of_package.vim'
NeoBundle 'nakatakeshi/open_model_rb.vim'
"NeoBundle 'vim-scripts/errormarker.vim'
"NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tomtom/tcomment_vim.git'
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundle 'jelera/vim-javascript-syntax'
" NeoBundle 'teramako/jscomplete-vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-scripts/monday'
NeoBundle 'rking/ag.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'itchyny/lightline.vim'
" ruby
NeoBundle 'ngmy/vim-rubocop'
NeoBundle 'tpope/vim-endwise'

NeoBundle 'rhysd/vim-operator-surround'

filetype plugin indent on     " required!

:syntax enable
set t_Co=256

"set background=dark
":colorscheme solarized
":colorscheme  desert256
":colorscheme  xoria256
":colorscheme  molokai
"this
":colorscheme calmar256-dark
"colorscheme wombat256
:colorscheme slate
"cのauato indent
":set cindent
:set autoindent
"インクリメンタル検索
":set incsearch
" scroll
set scrolloff=20
"検索結果色分け
:set hlsearch
"clipboard共有
:set clipboard+=autoselect
:set clipboard+=unnamed
"ショートカット系
:ab #s ##############################################
"クリップボードをWindowsと連携
set clipboard=unnamed
" Visual選択で選択されたテキストが、自動的にクリップボードレジスタ "*" にコピーされる。
:set guioptions+=a
"backspaceキー
":set backspace=2
:set backspace=indent,eol,start
"行番号を表示する
set number
" カーソルが何行目の何列目に置かれているかを表示する。（有効:ruler/無効:noruler）
:set ruler
" シフト移動幅をのshiftwidth値の倍数に丸める
:set shiftround
"シフト移動幅 インデントされたtabの見た目のながさ
set shiftwidth=4
" Insertモードで <Tab> を挿入するとき、代わりに適切な数の空白を使う。（有効:expandtab/無効:noexpandtab）
:set expandtab
" たまにnoexpandtabになりやがるのでmap
nnoremap ex :<C-u>:set expandtab<CR>
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"ファイル内の <Tab> が対応する空白の数 ファイル内のtabのみためのながさ
set tabstop=4
"tabを挿入した際のスペースの数
set softtabstop=4
"タブ文字を表示
set lcs=tab:>.,eol:$,trail:_,extends:\
"行頭のタブを表示
highlight TabSpace ctermbg=DarkGreen
match TabSpace /\t\|\s\+$/
"" set tab color
hi TabLineSel ctermbg=DarkMagenta

" fold
set foldmethod=syntax
let perl_fold=1
set foldlevel=100 "Don't autofold anything

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 入力されているテキストの最大幅。行がそれより長くなると、この幅を超えないように空白の後で改行される。値を 0 に設定すると無効になる。
:set textwidth=0

" 縦分割をする際、新しいウィンドウを右側に作る
set splitright

"変更中のファイルでも、保存しないで他のファイルを表示
set hidden

" マウスモード有効
set mouse=a
" screen対応
set ttymouse=xterm2

" 一度に複数開けるtabの個数
set tabpagemax =100

" 行末のスペースハイライト
set list
set listchars=tab:>-,trail:-,nbsp:-,extends:>,precedes:<,

" カーソル行をハイライト
"set cursorline
" カレントウィンドウにのみ罫線を引く
"augroup cch
"  autocmd! cch
"  autocmd WinLeave * set nocursorline
"  autocmd WinEnter,BufRead * set cursorline
"augroup END

":hi clear CursorLine
":hi CursorLine gui=underline
"highlight CursorLine ctermbg=black guibg=black


"ウィンドウを最大化して起動
"au GUIEnter * simalt ~x

""""""""""""""""""""""""""""""
"挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

" 最下ウィンドウにいつステータス行が表示されるかを設定する。
"               0: 全く表示しない
"               1: ウィンドウの数が2以上のときのみ表示
"               2: 常に表示
:set laststatus=2
" ステータスライン表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" コマンド (の一部) を画面の最下行に表示する。（有効:showcmd/無効:noshowcmd）
:set showcmd

if &term =~ "screen"
   " screen Buffer 切り替えで screen にファイル名を表示
   autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | silent!  exe '!echo -n "^[kv:%^[\\"' | endif
   autocmd VimLeave * silent!  exe '!echo -n "^[k`basename $PWD`^[\\"'
endif

" }}}

" 文字コード関連 {{{

set fileencodings=utf-8,iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,ucs-bom,euc-jp,eucjp-ms,cp932
set fileencoding=utf-8


" }}}

" perl config {{{

"コンパイラの指定
autocmd FileType perl,cgi :compiler perl  

" add plack path
autocmd FileType perl :setlocal path+=/usr/local/bundle-plack/lib/perl5/,/usr/local/bundle-plack/lib/perl5/x86_64-linux-thread-multi/,lib/
" .tファイルもperlのsyntax表示にする
autocmd BufNewFile,BufRead *.t set filetype=perl
" .yamlファイルもperlのsyntax表示にする
autocmd BufNewFile,BufRead *.yaml,*.yml set filetype=perl

autocmd BufWritePost,FileWritePost *.p[lm] !perl -wc %

" au BufWritePost *.pl,*.pm :call ReloadApache()
function! ReloadApache()
    call system($HOME. '/bin/restart_apache.pl')
endfunction

" for perl tidy
map ,ptv <Esc>:'<,'>! perltidy<CR>

" }}}

" map {{{

"yanktmp.vim
map <silent> sy :call YanktmpYank()<cr>
map <silent> sp :call YanktmpPaste_p()<cr>
map <silent> sP :call YanktmpPaste_P()<cr> 
let g:yanktmp_file = $HOME . '/tmp/yanktmp'

" 範囲選択してpasteするとレジスタが書き換わっちゃうのでレジスタ操作
vnoremap p "0p

" paste yanked string vertically
vnoremap <C-p> I<C-r>"<ESC><ESC>

" pc check pe execute
autocmd FileType perl :map pc :!perl -cw -I lib %
autocmd FileType perl :map pe :!perl -w -I lib %
autocmd FileType perl :map et <Esc>:!perl -w -I lib -I t/inc %<Enter>

" tab indent
"nmap <tab> v>
"nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv

" 縦分割した後、カーソル下のタグへジャンプ
noremap sd :vsplit<ENTER><C-]>

" for search_pm.vim
"let g:search_lib_dir = [ 'lib', 'inc']
autocmd FileType perl :noremap fg :call Jump2pm('vne')<ENTER>
autocmd FileType perl :noremap ff :call Jump2pm('e')<ENTER>
autocmd FileType perl :noremap fe :call Jump2pm('sp')<ENTER>
autocmd FileType perl :noremap fd :call Jump2pm('to sp')<ENTER>
autocmd FileType perl :noremap ft :call Jump2pm('tabe')<ENTER>
autocmd FileType perl :noremap fb :call Jump2pm('bo vsp')<ENTER>
autocmd FileType perl :vnoremap fg :call Jump2pmV('vne')<ENTER>
autocmd FileType perl :vnoremap ff :call Jump2pmV('e')<ENTER>
autocmd FileType perl :vnoremap fe :call Jump2pmV('sp')<ENTER>
autocmd FileType perl :vnoremap fd :call Jump2pmV('to sp')<ENTER>
autocmd FileType perl :vnoremap ft :call Jump2pmV('tabe')<ENTER>
autocmd FileType perl :vnoremap fb :call Jump2pmV('bo vsp')<ENTER>
let search_lib_dir_opening = 'lib/,/usr/local/bundle-plack/lib/perl5/,/usr/local/bundle-plack/lib/perl5/x86_64-linux-thread-multi/'

autocmd FileType perl :noremap ss :call Jump2sub()<ENTER>
autocmd FileType javascript :noremap ss :call Jump2func()<ENTER>
autocmd FileType ruby :noremap ss :call Jump2def()<ENTER>

" load spec
autocmd FileType ruby :noremap <C-t> :call LoadSpec('bel vne')<ENTER>
" map esc to ctrl + 
inoremap <C-k> <ESC>

nmap <silent> <buffer> em :PerlUseInsertionCWord<CR>
" del end space
map sd :%s/ *$//<ENTER>
" map wk wj wl wh to window move
map <silent> wk <C-w>k
map <silent> wj <C-w>j
map <silent> wl <C-w>l
map <silent> wh <C-w>h
" map gh gl to tab move
map <silent> gh gT
map <silent> gl gt

" map te to :tabe
map te <Esc>:tabe<Space>
" http://vim-users.jp/2011/04/hack214/
noremap ) t)
noremap ( t(
" 一番最後に編集していた箇所を選択
nnoremap gc `[v`]<Left>

" コマンドモード時にカーソル移動するのに便利ー
map! <C-a> <Home>
map! <C-e> <End>
map! <C-f> <Right>
map! <C-b> <Left>
map! <C-V> <C-R>"
" *検索時に次に行かないようにする
nnoremap * *N

" home end
noremap <C-a> <Home>
noremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>

" del
inoremap <C-l> <Del>

" コマンドモードで閉じる
noremap fuck :qa!<CR>
noremap q :q<CR>
" コマンドモードでsave
noremap ; :w<CR>

" set paste 入れ替え
nmap <Leader>1 <SID>(toggle-paste)
nnoremap <SID>(toggle-paste)          :<C-u>set paste!<CR>

" }}}


" for plugin {{{

source $VIMRUNTIME/macros/matchit.vim

":%! ~/bin/js_swell.plで整形 微妙
"map ,jst <Esc>:'<,'>! perl ~/bin/js_swell.pl<CR>

" pathogen.vim
" call pathogen#helptags()
" call pathogen#runtime_append_all_bundles()


" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

""" unite.vim
" window height
let g:unite_winheight=10
" バッファ一覧
nmap <silent> ,ub :<C-u>Unite -no-quit -immediately buffer<CR>
" 現バッファからのファイル一覧
nmap <silent> ,uwb :<C-u>UniteWithBufferDir -no-quit -immediately -buffer-name=files file<CR>
" カレントDirからのファイル一覧
nmap <silent> ,uwc :<C-u>UniteWithBufferDir -no-quit -immediately -buffer-name=files file<CR>
" 最近使用したファイル一覧
nmap <silent> ,um :<C-u>Unite -no-quit -immediately file_mru<CR>
" レジスタ一覧
nmap <silent> ,ur :<C-u>Unite -no-quit -immediately -buffer-name=register register<CR>
" 常用セット
nmap <silent> ,uu :<C-u>Unite -no-quit -immediately buffer file_mru<CR>
" 全部乗せ
nmap <silent> ,ua :<C-u>UniteWithBufferDir -no-quit -immediately -buffer-name=files buffer file_mru bookmark file<CR>

" unite-neco {{{
let s:unite_source = {'name': 'neco'}

function! s:unite_source.gather_candidates(args, context)
  let necos = [
        \ "~(-'_'-) goes right",
        \ "~(-'_'-) goes right and left",
        \ "~(-'_'-) goes right quickly",
        \ "~(-'_'-) skips right",
        \ "~(-'_'-)  -8(*'_'*) go right and left",
        \ "(=' .' ) ~w",
        \ ]
  return map(necos, '{
        \ "word": v:val,
        \ "source": "neco",
        \ "kind": "command",
        \ "action__command": "Neco " . v:key,
        \ }')
endfunction

"function! unite#sources#locate#define()
"  return executable('locate') ? s:unite_source : []
"endfunction
call unite#define_source(s:unite_source)

" }}}

" Neocomplecache {{{
"起動時に有効
let g:neocomplcache_enable_at_startup = 1
"ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplcache_max_list = 20
"自動補完を行う入力数を設定。初期値は2
let g:neocomplcache_auto_completion_start_length = 2
"手動補完時に補完を行う入力数を制御。値を小さくすると文字の削除時に重くなる
let g:neocomplcache_manual_completion_start_length = 3
"バッファや辞書ファイル中で、補完の対象となるキーワードの最小長さ。初期値は4。
let g:neocomplcache_min_keyword_length = 4
"シンタックスファイル中で、補完の対象となるキーワードの最小長さ。初期値は4。
let g:neocomplcache_min_syntax_length = 4
"1:補完候補検索時に大文字・小文字を無視する
let g:neocomplcache_enable_ignore_case = 1
"入力に大文字が入力されている場合、大文字小文字の区別をする
let g:neocomplcache_enable_smart_case = 1
"DTと入力するとD*T*と解釈され、DateTime等にマッチする。
let g:neocomplcache_enable_camel_case_completion = 0
"アンダーバーを区切りとしたあいまい検索を行うかどうか。
"m_sと入力するとm*_sと解釈され、mb_substr等にマッチする。
let g:neocomplcache_enable_underbar_completion = 0
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Or set this.
let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
let g:neocomplcache_enable_insert_char_pre = 1

"行頭のスペースの連続をハイライトさせる
"Tab文字も区別されずにハイライトされるので、区別したいときはTab文字の表示を別に
"設定する必要がある。
function! SOLSpaceHilight()
    syntax match SOLSpace "^\s\+" display containedin=ALL
    highlight SOLSpace term=reverse cterm=none ctermbg=242
endf
"全角スペースをハイライトさせる。
function! JISX0208SpaceHilight()
    syntax match JISX0208Space "　" display containedin=ALL
    highlight JISX0208Space term=reverse cterm=none ctermbg=242
endf
"syntaxの有無をチェックし、新規バッファと新規読み込み時にハイライトさせる
if has("syntax")
"    syntax on
        augroup invisible
        autocmd! invisible
        "autocmd BufNew,BufRead * call SOLSpaceHilight()
        autocmd BufNew,BufRead * call JISX0208SpaceHilight()
    augroup END
endif

" jslint.vim
" map co to :copen
"map co <Esc>:copen<Enter>
"let g:JSLintHighlightErrorLine = 0

" for js-beautify
map ,jsb <Esc>:'<,'>! js-beautify -<CR>

" operator-camelize.vim
map <Leader>S <Plug>(operator-camelize)
map <Leader>s <Plug>(operator-decamelize)



nnoremap ,uf :<C-u>call perl_file_of_package#PerlFileOfPackage()<CR>

" unite ack
"function! s:escape_visual(...) "{{{
"    let escape = a:0 ? a:1 : ''
"    normal `<
"    let s = col('.') - 1
"    normal `>
"    let e = col('.') - 1
"    let line = getline('.')
"    let pat = line[s : e]
"    return escape(pat, escape)
"endfunction"}}}
"function! s:visual_unite_input() "{{{
"    return s:escape_visual(" ")
"endfunction"}}}
"function! s:visual_unite_arg() "{{{
"    return s:escape_visual(' :\')
"endfunction"}}}

"nnoremap <silent> <Space>a  :<C-u>exe "Unite -buffer-name=ack ack::" . escape(expand('<cword>'),' :\')<CR>
"vnoremap <silent> <Space>a  :<C-u>exe "Unite -buffer-name=ack ack::" . <SID>visual_unite_arg()<CR>
"nnoremap <silent> <Space>A  :<C-u>UniteResume ack<CR>
"call unite#custom_filters('ack', ['matcher_default', 'sorter_default', 'converter_ack_shortcut'])


" Perldocをよぶ
function! PerldocNow()
    let s:save_iskeyword = &iskeyword
    setlocal iskeyword+=:
    let s:save_yank_anonymous_reg = @"
    try
        normal yiw
        let s:package_name = @"

        "" check procedure string
        if (s:package_name !~ '^[_A-Za-z0-9:]\+[^:]$')
            echo 'illegal expression'
            return
        endif
    finally
        "" back setting.
        let @" = s:save_yank_anonymous_reg
        let &iskeyword = s:save_iskeyword
    endt
    execute(printf("Perldoc %s", s:package_name))
endfunction
nnoremap pd :<C-u>call PerldocNow()<CR>

let g:path_to_vimrc_local = '~/.vimrc_local'

if filereadable(expand(g:path_to_vimrc_local))
  execute printf('source %s', expand(g:path_to_vimrc_local))
endif

" syntastic {{{

"let g:syntastic_mode_map = {
"      \  'mode': 'active',
"      \ 'active_filetypes': ['perl', 'javascript'],
"      \ 'passive_filetypes': []
"      \ }
"let g:syntastic_auto_jump=1
"let g:syntastic_auto_loc_list=1
" }}}

" mkd.vim {{{

autocmd BufRead,BufNewFile *.mkd  set filetype=mkd
autocmd BufRead,BufNewFile *.md   set filetype=mkd
" }}}

" Simple-Javascript-Indenter
" この設定入れるとshiftwidthを1にしてインデントしてくれる
let g:SimpleJsIndenter_BriefMode = 1
" この設定入れるとswitchのインデントがいくらかマシに
let g:SimpleJsIndenter_CaseIndentLevel = -1

" vim-javascript-syntax
au FileType javascript call JavaScriptFold()
" 折り畳みしちゃうので回避
set foldlevel=100


set history=100

" use ag in ack.vim {{{
let g:ackprg = 'ag'
" }}}

" fugitive.vim {{{
nmap <silent> ,gs :<C-u>Gstatus<CR>
nmap <silent> ,ga :<C-u>Gwrite<CR>
nmap <silent> ,gr :<C-u>Gremove<CR>
nmap <silent> ,gc :<C-u>Gcommit<CR>
nmap <silent> ,gd :<C-u>Gdiff<CR>
nmap <silent> ,gl :<C-u>Glog<CR>
" }}}

"
noremap gu :call GithubUrl()<enter>
" vim-indent-guides{{{
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラーを無効にする
let g:indent_guides_auto_colors=0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1
" }}}

" lightline {{{
let g:lightline = {
      \ 'colorscheme': 'wombat'
      \ }
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode'
        \ }
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:p') ? expand('%:p') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" }}}

" for go
set rtp+=$GOROOT/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview

if exists("g:did_load_filetypes")
  filetype off
  filetype plugin indent off
endif
"set runtimepath+=$GOROOT/misc/vim " replace $GOROOT with the output of: go env GOROOT
filetype plugin indent on
syntax on
autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd FileType go compiler go
" omni competion
autocmd FileType go inoremap <C-i> <C-x><C-o>
autocmd FileType go :map ep <Esc>:!go run %


" for ruby
" {{{ vim-rubocop
autocmd FileType ruby :nmap <Leader>r :RuboCop<CR>
autocmd FileType ruby setlocal ts=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType ruby :map ,s <Esc>:!PADRINO_FAST_LOADER=1 bundle exec parallel_rspec -n 2 %
" open_model_rb.vim
" vertical split and jump to app file in current window
autocmd FileType ruby :noremap fg :call OpenAppModel('vne')<ENTER>
" jump to app file in current window
autocmd FileType ruby :noremap ff :call OpenAppModel('e')<ENTER>
" split window horizontal, and ...
autocmd FileType ruby :noremap fd :call OpenAppModel('sp')<ENTER>
" open tab, and ...
autocmd FileType ruby :noremap fd :call OpenAppModel('tabe')<ENTER>
" for visual mode, use OpenAppModelV()
autocmd FileType ruby :vnoremap fg :call OpenAppModelV('vne')<ENTER>

" }}}

" for ctags
nmap fl :vsp<CR><C-]>
nmap fi :sp<CR><C-]>
nmap fo :tabe %<CR><C-]>
map ge <Esc>:call vimproc#popen2('/usr/local/bin/ctags -R ./ ' . $HOME . '/.rbenv/versions/2.0.0-p481/lib/ruby/gems/2.0.0/gems/')

" for vim-operator-surround
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)
nmap a( saiw(
nmap a" saiw"
nmap a' saiw'
nmap a[ saiw[
nmap a{ saiw{
nmap a` saiw`
nmap d( sda(
nmap d" sda"
nmap d' sda'
nmap d[ sda[
nmap d{ sda{
nmap d` sda`
nmap r( sra(
nmap r" sra"
nmap r' sra'
nmap r[ sra[
nmap r{ sra{
nmap r` sra`
