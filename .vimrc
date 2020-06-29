set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/L9'
Plugin 'mattn/emmet-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ivalkeen/nerdtree-execute'
Plugin 'scrooloose/nerdcommenter' " comment code
Plugin 'godlygeek/tabular' " algin cols
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-fugitive' " git
Plugin 'juneedahamed/svnj.vim' " svn
Plugin 'yssl/QFEnter' " quickfix
" Plugin 'feix760/autospace.vim'
Plugin 'feix760/taboo.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'othree/html5.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'hail2u/vim-css3-syntax'
" Plugin 'ashisha/image.vim'
" Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'zerowidth/vim-copy-as-rtf'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'easymotion/vim-easymotion'
Plugin 'groenewege/vim-less'
Plugin 'posva/vim-vue'
Plugin 'feix760/vim-javascript-gf'
" Plugin 'marijnh/tern_for_vim'
Plugin 'niftylettuce/vim-jinja'
Plugin 'vim-syntastic/syntastic'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'vim-scripts/actionscript.vim'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'jasonshell/vim-svg-indent'
call vundle#end()
filetype plugin indent on

" let g:netrw_altv = 1
let g:NERDSpaceDelims = 1
" let g:NERDCompactSexyComs = 1
" let g:NERDCommentEmptyLines = 1
let g:NERDTreeIgnore = [ '^_.*@.*@[[dir]]' ]
let g:NERDTreeRespectWildIgnore = 1

let g:jsx_ext_required = 0

set completeopt-=preview
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_auto_trigger = 0
let g:ycm_key_invoke_completion = '<C-N>'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:autoformat_verbosemode = 1
let g:formatters_jsx = ['jsbeautify_javascript', 'pyjsbeautify_javascript', 'jscs']
let g:formatters_javascript_jsx = ['jsbeautify_javascript', 'pyjsbeautify_javascript', 'jscs']

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1

let mapleader = ","
let g:mapleader = ","
nn \ ,

com! Sdiff SVNDiff
com! Sblame SVNBlame

let g:taboo_tab_format = ' %N%m %s '
let g:taboo_modified_tab_flag = '+'

let g:snips_author = '飞羏'
let g:snips_mail = 'feixiang.yfx@alibaba-inc.com'

let g:qfenter_open_map = ['<CR>', 'o']
let g:qfenter_vopen_map = ['<C-v>']
let g:qfenter_hopen_map = ['<C-x>']
let g:qfenter_topen_map = ['<C-t>']

let g:NERDTreeWinSize = 20

nn <leader>n :NERDTreeToggle<cr>

let g:tagbar_type_javascript = {
     \ 'ctagsbin': '/usr/local/bin/jsctags'
     \ }
nn <leader>t :TagbarToggle<cr>

let g:ctrlp_map = '<c-u>'
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_custom_ignore = {
     \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|dist|public|bin-debug|bin-release)$',
     \ 'file': '\v\.(exe|dll)$',
     \ 'link': 'some_bad_symbolic_links',
     \ }

let g:tsuquyomi_disable_default_mappings = 1
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_definition_split = 3
autocmd FileType typescript nn <buffer> <C-]> :TsuDefinition<CR>
autocmd FileType typescriptreact nn <buffer> <C-]> :TsuDefinition<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
let g:syntastic_typescriptreact_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": [ "typescript", "typescriptreact" ],
    \ "passive_filetypes": [] }

vn <leader>a;  :Tabularize /^[^:]*\zs:<cr>
vn <leader>a=  :Tabularize /^[^=]*\zs=<cr>

set diffopt=vertical

let g:user_emmet_settings = {
    \ 'variables': {
    \   'lang': "zh_CN",
    \   'locale': "zh_CN"
    \ },
    \ 'html' : {
    \     'default_attributes': {
    \         'script': [],
    \         'button': [{'type': 'button'}]
    \     }
    \ }
    \ }

runtime macros/matchit.vim
syntax enable
set synmaxcol=400 " prevent slow when a line is too long
set background=dark
colorscheme desert
set hidden
set cursorline
set showcmd
set number
set history=700
filetype plugin on
filetype indent on
set ai "Auto indent
set wrap "Wrap lines
set autoread
set helplang=cn
set wildignore=*.o,*~,*.pyc,*.swp
set ruler
set showmatch
set cmdheight=2
set ignorecase
set hlsearch
set incsearch
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
" Files, backups and undo
set nobackup
set nowb
set noswapfile
" Linebreak on 500 characters
" set lbr
set tw=500
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set fileencodings=utf-8,gbk,big5
set colorcolumn=101
highlight colorcolumn ctermbg=red ctermfg=white

au BufEnter *.js,*.jsx,*.html,*.scss,*.less,*.tpl,*.vue,*.ts,*.tsx,*.xml,*.exml match ExtraWhitespace /\s\+$/
hi ExtraWhitespace ctermbg=red guibg=red

nn <leader>w :w<cr>
nn <leader>q :q<cr>
nn <space> /
vn <space> "/y/\V<c-r>"<cr>
" window
nn <C-j> <C-W>j
nn <C-k> <C-W>k
nn <C-h> <C-W>h
nn <C-l> <C-W>l

nn ( f(
nn ) f)
vn ( f(
vn ) f)
" just back (
nn ,) )
nn ,( (
vn ,( (
vn ,) )
" parent block
nn { [{
nn } ]}
nn ,{ ?}<cr>:noh<cr>%
nn ,} /{<cr>:noh<cr>%
vn { [{
vn } ]}
" html parent node
nn [t vatatov
nn ]t vatatv
nn <leader>a VggoG
nn <c-n> gt
nn <c-p> gT

ino <c-h> <Left>
ino <c-j> <Down>
ino <c-k> <Up>
ino <c-l> <right>
ino <c-c> <esc>
cno <c-p> <up>
cno <c-n> <down>
vn <c-c> <esc>

nn <c-m> :noh<cr>
" add(use) new line blow
nn <s-u> o<esc>
" break(kill) to new line
nn <s-k> i<cr><esc>
" folder
nn zt zfat
nn z[ :sil! normal $zfa{<cr>
" set fdm=syntax
set isfname=@,48-57,/,.,-,_,+,,,#,$,%,~,=,@-@

nn <leader>p "0p
nn <leader><s-p> "0P
vn <leader>p "0p
vn <leader><s-p> "0P
nn <leader>d "_d
vn <leader>d "_d
set pastetoggle=<f5>
set iskeyword+=-,$
nnoremap <F5> :buffers<CR>:buffer<Space>

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

hi MatchParen cterm=none ctermbg=green ctermfg=white

" wechat wxml/wxss
au BufEnter *.wxml exe ":set ft=xml"
au BufEnter *.wxss exe ":set ft=css"

au BufEnter *.js,*.html,*.scss,*.less 
    \ if &fileencoding != 'utf-8' | echo 'Warn: encoding is '.&fileencoding .', not utf-8' | endif

" Return to last edit position when opening files 
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" diff change
fun! s:DiffChange()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfun
com! DiffChange call s:DiffChange()

com! CamelCase s#_\(\l\)#\u\1#g

" toggle line number
nn <silent> <f6> :if &number \| set nonumber \| else \| set number \| endif<cr>

" use ctrlp to search file under the cursor
fun! SearchFileUnderCursor()
    let line = getline('.')
    let start = col('.') - 1
    let chars = '[[:alnum:]-_./\\]\+'
    while start >= 0 && match(line[start], chars) >= 0
        let start -= 1
    endwhile
    let str = matchstr(line, chars, start)
    let str = substitute(substitute(str, '^\.\+', '', ''), '^[\\/]', '', '')
    if str != ''
        let g:ctrlp_lazy_update = 10
        CtrlP
        exe 'normal '.substitute(str, '[\-]', '', 'g')
        let g:ctrlp_lazy_update = 0
    endif
endfun
au BufEnter *.js,*.html,*.scss,*.less,*.tpl,*.ts nn <buffer> gp :call SearchFileUnderCursor()<cr>

au BufNewFile,BufRead *.tpl,*.html set ft+=.jinja
au BufNewFile,BufRead *.axml set ft=xml
au BufNewFile,BufRead *.as set ft=java
au BufNewFile,BufRead *.acss set ft+=.sass
au BufNewFile,BufRead *.snap set ft=javascript
set complete-=i

" macvim
set guifont=Menlo:h18
set guioptions-=L
let g:pymode_python = 'python3'
