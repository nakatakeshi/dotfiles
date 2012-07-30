" basic config {{{

" neobundle
set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin indent off     " required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
"NeoBundle 'Shougo/vimproc' " make at local
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'hallettj/jslint.vim'
NeoBundle 'tyru/operator-camelize.vim'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'vim-scripts/yanktmp.vim'
NeoBundle 'vimtaku/vim-textobj-sigil'
NeoBundle 't9md/vim-unite-ack'
NeoBundle 'h1mesuke/textobj-wiw'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'msanders/snipmate.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'nakatakeshi/.vim'
NeoBundle 'nakatakeshi/jump2pm.vim'
"NeoBundle 'vim-scripts/errormarker.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplcache'

" local files
"NeoBundle 'im_control', {'type' : 'nosync', 'base' : '~/.vim/bundle/manual'}

filetype plugin indent on     " required!

:syntax enable
set t_Co=256

":colorscheme  desert256
":colorscheme  xoria256
":colorscheme  molokai
:colorscheme calmar256-dark
"colorscheme wombat256
":colorscheme slate
"cのauato indent
":set cindent
:set autoindent
"インクリメンタル検索
":set incsearch
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
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

if &term =~ "screen"
   " screen Buffer 切り替えで screen にファイル名を表示
   autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | silent!  exe '!echo -n "^[kv:%^[\\"' | endif
   autocmd VimLeave * silent!  exe '!echo -n "^[k`basename $PWD`^[\\"'
endif

" }}}

" 文字コード関連 {{{

":set fenc=euc-jp
":set fenc=utf-8
" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif

set fileencodings=iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,utf-8,ucs-bom,euc-jp,eucjp-ms,cp932
set fileencoding=utf-8


" 改行コードの自動認識
set fileformats=unix,dos,mac

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

"autocmd BufWritePost,FileWritePost *.p[lm] !perl -MFindBin::libs -wc %

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
vnoremap p "_dP

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
noremap fg :call Jump2pm('vne')<ENTER>
noremap ff :call Jump2pm('e')<ENTER>
noremap fe :call Jump2pm('sp')<ENTER>
noremap fd :call Jump2pm('to sp')<ENTER>
noremap ft :call Jump2pm('tabe')<ENTER>
noremap fb :call Jump2pm('bo vsp')<ENTER>
let search_lib_dir_opening = 'lib/,/usr/local/bundle-plack/lib/perl5/,/usr/local/bundle-plack/lib/perl5/x86_64-linux-thread-multi/'

autocmd FileType perl :noremap ss :call Jump2sub()<ENTER>
autocmd FileType javascript :noremap ss :call Jump2func()<ENTER>

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
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()


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
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Or set this.
let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
let g:neocomplcache_enable_insert_char_pre = 1

" }}}

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



" Package::Hogeからlib/Package/Hoge/配下の一覧のファイルをuniteで表示する
function! FileOfPackage()
    let s:root_path = FindBranchRoot()
    let s:pm_ext    = ".pm"

    let s:save_iskeyword = &iskeyword
    setlocal iskeyword+=:
    let s:save_yank_anonymous_reg = @"

    try
        normal yiw
        let s:package_name = @"
        "" check procedure string
        if (s:package_name !~ '^[_A-Za-z0-9:]\+$')
            echo 'illegal expression'
            return
        endif

    finally
        "" back setting.
        let @" = s:save_yank_anonymous_reg
        let &iskeyword = s:save_iskeyword
    endt
    let s:package_path = substitute(s:package_name, '::','/','g')
    let s:ab_package_path = s:root_path . "lib/" . s:package_path
    if (!filereadable(s:ab_package_path) && !filereadable(s:ab_package_path . s:pm_ext))
        let s:package_path = substitute(s:package_path,'/[^(/)]*$','','g')
    endif

    execute(printf("Unite file_of_package:%s -input=%s", s:package_path, s:package_path))
endfunction
nnoremap ,uf :<C-u>call FileOfPackage()<CR>

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

let g:syntastic_mode_map = {
      \  'mode': 'active',
      \ 'active_filetypes': ['perl', 'javascript'],
      \ 'passive_filetypes': []
      \ }
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
" }}}

" mkd.vim

autocmd BufRead,BufNewFile *.mkd  set filetype=mkd
autocmd BufRead,BufNewFile *.md   set filetype=mkd

set history=100

