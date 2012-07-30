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
"c��auato indent
":set cindent
:set autoindent
"���󥯥��󥿥븡��
":set incsearch
"������̿�ʬ��
:set hlsearch
"clipboard��ͭ
:set clipboard+=autoselect
:set clipboard+=unnamed
"���硼�ȥ��åȷ�
:ab #s ##############################################
"����åץܡ��ɤ�Windows��Ϣ��
set clipboard=unnamed
" Visual��������򤵤줿�ƥ����Ȥ�����ưŪ�˥���åץܡ��ɥ쥸���� "*" �˥��ԡ�����롣
:set guioptions+=a
"backspace����
":set backspace=2
:set backspace=indent,eol,start
"���ֹ��ɽ������
set number
" �������뤬�����ܤβ����ܤ��֤���Ƥ��뤫��ɽ�����롣��ͭ��:ruler/̵��:noruler��
:set ruler
" ���եȰ�ư�����shiftwidth�ͤ��ܿ��˴ݤ��
:set shiftround
"���եȰ�ư�� ����ǥ�Ȥ��줿tab�θ����ܤΤʤ���
set shiftwidth=4
" Insert�⡼�ɤ� <Tab> ����������Ȥ��������Ŭ�ڤʿ��ζ����Ȥ�����ͭ��:expandtab/̵��:noexpandtab��
:set expandtab
"�Ĥ���̤����Ϥ��줿�Ȥ����б������̤�ɽ������
set showmatch
"�ե�������� <Tab> ���б��������ο� �ե��������tab�Τߤ���Τʤ���
set tabstop=4
"tab�����������ݤΥ��ڡ����ο�
set softtabstop=4
"����ʸ����ɽ��
set lcs=tab:>.,eol:$,trail:_,extends:\
"��Ƭ�Υ��֤�ɽ��
highlight TabSpace ctermbg=DarkGreen
match TabSpace /\t\|\s\+$/
"" set tab color
hi TabLineSel ctermbg=DarkMagenta

"����������Ƭ�������ǻߤޤ�ʤ��褦�ˤ���
set whichwrap=b,s,h,l,<,>,[,]
" ���Ϥ���Ƥ���ƥ����Ȥκ��������Ԥ�������Ĺ���ʤ�ȡ���������Ķ���ʤ��褦�˶���θ�ǲ��Ԥ���롣�ͤ� 0 �����ꤹ���̵���ˤʤ롣
:set textwidth=0

" ��ʬ��򤹤�ݡ�������������ɥ���¦�˺��
set splitright

"�ѹ���Υե�����Ǥ⡢��¸���ʤ���¾�Υե������ɽ��
set hidden

" �ޥ����⡼��ͭ��
set mouse=a
" screen�б�
set ttymouse=xterm2

" ���٤�ʣ��������tab�θĿ�
set tabpagemax =100

" �����Υ��ڡ����ϥ��饤��
set list
set listchars=tab:>-,trail:-,nbsp:-,extends:>,precedes:<,

" ��������Ԥ�ϥ��饤��
"set cursorline
" �����ȥ�����ɥ��ˤΤ߷��������
"augroup cch
"  autocmd! cch
"  autocmd WinLeave * set nocursorline
"  autocmd WinEnter,BufRead * set cursorline
"augroup END

":hi clear CursorLine
":hi CursorLine gui=underline
"highlight CursorLine ctermbg=black guibg=black


"������ɥ�����粽���Ƶ�ư
"au GUIEnter * simalt ~x

""""""""""""""""""""""""""""""
"�����⡼�ɻ������ơ������饤��ο����ѹ�
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

" �ǲ�������ɥ��ˤ��ĥ��ơ������Ԥ�ɽ������뤫�����ꤹ�롣
"               0: ����ɽ�����ʤ�
"               1: ������ɥ��ο���2�ʾ�ΤȤ��Τ�ɽ��
"               2: ���ɽ��
:set laststatus=2
" ���ơ������饤��ɽ��
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ���ޥ�� (�ΰ���) ����̤κǲ��Ԥ�ɽ�����롣��ͭ��:showcmd/̵��:noshowcmd��
:set showcmd
" ���Ȥ�����ʸ�������äƤ⥫��������֤�����ʤ��褦�ˤ���
if exists('&ambiwidth')
  set ambiwidth=double
endif

if &term =~ "screen"
   " screen Buffer �ڤ��ؤ��� screen �˥ե�����̾��ɽ��
   autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | silent!  exe '!echo -n "^[kv:%^[\\"' | endif
   autocmd VimLeave * silent!  exe '!echo -n "^[k`basename $PWD`^[\\"'
endif

" }}}

" ʸ�������ɴ�Ϣ {{{

":set fenc=euc-jp
":set fenc=utf-8
" ʸ�������ɤμ�ưǧ��
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'  " iconv��eucJP-ms���б����Ƥ��뤫������å�
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconv��JISX0213���б����Ƥ��뤫������å�
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodings����
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
  " ������ʬ
  unlet s:enc_euc
  unlet s:enc_jis
endif
" ���ܸ��ޤޤʤ����� fileencoding �� encoding ��Ȥ��褦�ˤ���
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


" ���ԥ����ɤμ�ưǧ��
set fileformats=unix,dos,mac

" }}}

" perl config {{{

"����ѥ���λ���
autocmd FileType perl,cgi :compiler perl  

" add plack path
autocmd FileType perl :setlocal path+=/usr/local/bundle-plack/lib/perl5/,/usr/local/bundle-plack/lib/perl5/x86_64-linux-thread-multi/,lib/
" .t�ե������perl��syntaxɽ���ˤ���
autocmd BufNewFile,BufRead *.t set filetype=perl
" .yaml�ե������perl��syntaxɽ���ˤ���
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

" �ϰ����򤷤�paste����ȥ쥸�������񤭴���ä��㤦�Τǥ쥸�������
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

" ��ʬ�䤷���塢�������벼�Υ����إ�����
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
" ���ֺǸ���Խ����Ƥ����ս������
nnoremap gc `[v`]<Left>

" ���ޥ�ɥ⡼�ɻ��˥��������ư����Τ�������
map! <C-a> <Home>
map! <C-e> <End>
map! <C-f> <Right>
map! <C-b> <Left>
map! <C-V> <C-R>"
" *�������˼��˹Ԥ��ʤ��褦�ˤ���
nnoremap * *N

" ���ޥ�ɥ⡼�ɤ��Ĥ���
noremap fuck :qa!<CR>
noremap q :q<CR>
" ���ޥ�ɥ⡼�ɤ�save
noremap ; :w<CR>

" set paste �����ؤ�
nmap <Leader>1 <SID>(toggle-paste)
nnoremap <SID>(toggle-paste)          :<C-u>set paste!<CR>

" }}}


" for plugin {{{

source $VIMRUNTIME/macros/matchit.vim

":%! ~/bin/js_swell.pl������ ��̯
"map ,jst <Esc>:'<,'>! perl ~/bin/js_swell.pl<CR>

" pathogen.vim
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()


" ���ѥ��ڡ�����ɽ��
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /��/

""" unite.vim
" window height
let g:unite_winheight=10
" �Хåե�����
nmap <silent> ,ub :<C-u>Unite -no-quit -immediately buffer<CR>
" ���Хåե�����Υե��������
nmap <silent> ,uwb :<C-u>UniteWithBufferDir -no-quit -immediately -buffer-name=files file<CR>
" ������Dir����Υե��������
nmap <silent> ,uwc :<C-u>UniteWithBufferDir -no-quit -immediately -buffer-name=files file<CR>
" �Ƕ���Ѥ����ե��������
nmap <silent> ,um :<C-u>Unite -no-quit -immediately file_mru<CR>
" �쥸��������
nmap <silent> ,ur :<C-u>Unite -no-quit -immediately -buffer-name=register register<CR>
" ���ѥ��å�
nmap <silent> ,uu :<C-u>Unite -no-quit -immediately buffer file_mru<CR>
" �����褻
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
"��ư����ͭ��
let g:neocomplcache_enable_at_startup = 1
"�ݥåץ��åץ�˥塼��ɽ����������ο�������ͤ�100
let g:neocomplcache_max_list = 20
"��ư�䴰��Ԥ����Ͽ������ꡣ����ͤ�2
let g:neocomplcache_auto_completion_start_length = 2
"��ư�䴰�����䴰��Ԥ����Ͽ������档�ͤ򾮤��������ʸ���κ�����˽Ť��ʤ�
let g:neocomplcache_manual_completion_start_length = 3
"�Хåե��伭��ե�������ǡ��䴰���оݤȤʤ륭����ɤκǾ�Ĺ��������ͤ�4��
let g:neocomplcache_min_keyword_length = 4
"���󥿥å����ե�������ǡ��䴰���оݤȤʤ륭����ɤκǾ�Ĺ��������ͤ�4��
let g:neocomplcache_min_syntax_length = 4
"1:�䴰���両��������ʸ������ʸ����̵�뤹��
let g:neocomplcache_enable_ignore_case = 1
"���Ϥ���ʸ�������Ϥ���Ƥ����硢��ʸ����ʸ���ζ��̤򤹤�
let g:neocomplcache_enable_smart_case = 1
"DT�����Ϥ����D*T*�Ȳ�ᤵ�졢DateTime���˥ޥå����롣
let g:neocomplcache_enable_camel_case_completion = 0
"��������С�����ڤ�Ȥ��������ޤ�������Ԥ����ɤ�����
"m_s�����Ϥ����m*_s�Ȳ�ᤵ�졢mb_substr���˥ޥå����롣
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

"��Ƭ�Υ��ڡ�����Ϣ³��ϥ��饤�Ȥ�����
"Tabʸ������̤��줺�˥ϥ��饤�Ȥ����Τǡ����̤������Ȥ���Tabʸ����ɽ�����̤�
"���ꤹ��ɬ�פ����롣
function! SOLSpaceHilight()
    syntax match SOLSpace "^\s\+" display containedin=ALL
    highlight SOLSpace term=reverse cterm=none ctermbg=242
endf
"���ѥ��ڡ�����ϥ��饤�Ȥ����롣
function! JISX0208SpaceHilight()
    syntax match JISX0208Space "��" display containedin=ALL
    highlight JISX0208Space term=reverse cterm=none ctermbg=242
endf
"syntax��̵ͭ������å����������Хåե��ȿ����ɤ߹��߻��˥ϥ��饤�Ȥ�����
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



" Package::Hoge����lib/Package/Hoge/�۲��ΰ����Υե������unite��ɽ������
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


" Perldoc����
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

