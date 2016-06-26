set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'
Bundle 'drmingdrmer/xptemplate'
Bundle 'Valloric/ListToggle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'majutsushi/tagbar'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'tabbar'
Bundle 'a.vim'
Bundle 'ctrlp.vim'
Bundle 'AutoClose'
Bundle 'rking/ag.vim'
Bundle 'bling/vim-airline'
Bundle 'dyng/ctrlsf.vim'
Bundle 'derekwyatt/vim-scala'
"必不可少，在VIM的编辑窗口树状显示文件目录
Bundle 'The-NERD-tree'
"NERD出品的快速给代码加注释插件，选中，`ctrl+h`即可注释多种语言代码；
Bundle 'The-NERD-Commenter'
Bundle 'DoxygenToolkit.vim'
Bundle 'cespare/vim-toml'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'gcmt/breeze.vim'
Bundle 'gregsexton/MatchTag'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'Rykka/colorv.vim'
Bundle 'Yggdroot/indentLine'
Bundle 'mattn/emmet-vim'
Bundle 'docunext/closetag.vim'
Bundle 'posva/vim-vue'
Bundle 'marijnh/tern_for_vim'

set encoding=utf-8 " Set default encoding to UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"set foldmethod=indent
syntax enable
syntax on
colorscheme molokai
set cpt=.,w,b
set nocp
if has('gui_running')
    set transparency=2
else
    set t_Co=256
endif

filetype plugin indent on
set autoindent
set cindent
set cinoptions={0,:0,g0,l1,t0,(0)}
set completeopt=longest,menu
set hlsearch
set incsearch
set ignorecase

"对NERD_commenter的设置
let NERDShutUp=1


""set mouse=a
set number
set guifont=Monaco:h15
set cursorline " 突出显示当前行
set ruler " 打开状态栏标尺
set expandtab               "以下三个配置配合使用，设置tab和缩进空格数
set shiftwidth=4
set tabstop=4
set guioptions-=r
set guioptions-=L

let g:alternateExtensions_CPP = "inc,h,H,HPP,hpp"
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 10

"-----------------------------------------------------------------
" plugin - mark.vim 给各种tags标记不同的颜色，便于观看调式的插件。
" \m mark or unmark the word under (or before) the cursor
" \r manually input a regular expression. 用于搜索.
" \n clear this mark (i.e. the mark under the cursor),
" or clear all highlighted marks .
" \* 当前MarkWord的下一个 \# 当前MarkWord的上一个
" \/ 所有MarkWords的下一个 \? 所有MarkWords的上一个
"-----------------------------------------------------------------
"
let g:ctrlsf_open_left=0
let g:ctrlsf_position='bottom'

nnoremap <silent> <F3> :CtrlSF<CR>
nnoremap <silent> <S-F3> :CtrlSFOpen<CR>
nnoremap <silent> <F4> :TagbarToggle<CR>
nnoremap <silent> <F5> :NERDTree<CR>
"let g:tagbar_ctags_bin = '/usr/local/Cellar/ctags/5.8/bin/ctags'
let g:tagbar_width=30
let g:tagbar_left=1
nmap <F6> :lnext<cr>
nmap <F7> :lprevious<cr>
nnoremap <silent> <F11> :UndotreeToggle<CR>
nnoremap <silent> <F12> :A<CR>

let g:equ=1

"设置= + - * 前后自动空格

if exists("g:equ")
inoremap = <c-r>=EqualSign('=')<CR>
inoremap + <c-r>=EqualSign('+')<CR>
endif

function! EqualSign(char)
    let ex1 = getline('.')[col('.') - 3]
    let ex2 = getline('.')[col('.') - 2]
    let ex3 = col('.')

    if ex1 =~ "[=+><>\/\]"
        if ex2 !~ "/s"
            return "\<ESC>i".a:char."\<SPACE>"
        else
            return "\<ESC>xa".a:char."\<SPACE>"
        endif
    else
        if ex2 !~ "/s"
            return "\<SPACE>".a:char."\<SPACE>\<ESC>a"
        else
            return a:char."\<SPACE>\<ESC>a"
            "return ex3
        endif
    endif
endf


"以下是其他的一些配置

ino , ,<SPACE>
ino ; ;<SPACE>
ino <= <SPACE><=<SPACE>
ino => <SPACE>=><SPACE>
ino *= <SPACE>*=<SPACE>
ino /= <SPACE>/=<SPACE>
ino >> <SPACE>>><SPACE>
ino << <SPACE><<<SPACE>
ino >= <SPACE>>=<SPACE>
ino == <SPACE>==<SPACE>
ino += <SPACE>+=<SPACE>
ino && <SPACE>&&<SPACE>
ino != <SPACE>!=<SPACE>

nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gi :YcmCompleter GoToImprecise<CR>
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"set error or warning signs
let g:ycm_error_symbol='e>'
let g:ycm_warning_symbol='w>'
let g:ycm_semantic_triggers={}
"let g:ycm_semantic_triggers.c= ['->','.',' ','(','[','&']
let g:ycm_semantic_triggers={
            \   'c':['->','.'], 
            \   'objc':['->','.'], 
            \   'cpp,objcpp': ['->','.','::'], 
            \   'cs,java,typescript,d,python,perl6,scala,vb,elixir,go' : ['.', 're!(?=[a-zA-Z]{3,4})'], 
            \   'html':['<','"','</CR>','''"'], 
            \   'vim':['re![_a-za-z]+[_\w]*\.'], 
            \   'ruby':['.','::'], 
            \   'css':['re!^\s{2, 4}','re!:\s+'], 
            \   'javascript':['.','re!(?=[a-zA-Z]{3,4})'], 
            \ }

let g:ycm_always_populate_location_list=1
let g:ycm_open_loclist_on_ycm_diags=1
let g:ycm_cache_omnifunc=0
let g:ycm_python_binary_path='/usr/local/bin/python3'

let g:tern_show_signature_in_pum=1


let g:DoxygenToolkit_authorName=""
let g:DoxygenToolkit_licenseTag="My own license\<enter>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre = "@brief\t"
let g:DoxygenToolkit_paramTag_pre = "@param\t"
let g:DoxygenToolkit_returnTag = "@return\t"
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_maxFunctionProtoLines = 30


""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=1        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber

"let g:ackprg='ag --nogroup --column'

set laststatus=2

"for Ultisnips
let g:ycm_key_list_select_completion  =  ['<c-n>',  '<Down>']
let g:ycm_key_list_previous_completion  =  ['<c-p>',  '<Up>']
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"

let g:UltiSnipsEditSplit = "vertical"

"let g:instant_markdown_slow=1
" 在浏览器预览 for Mac
function! ViewInBrowser(name)
    let file = expand("%:p")
    let l:browsers = {
                \"cr":"open -a \"Google Chrome\"", 
                \"ff":"open -a Firefox", 
                \}
    let htdocs = '/Users/leon1/'
    let strpos = stridx(file,  substitute(htdocs,  '\\\\',  '\',  "g"))
    let file   =  '"'. file . '"'
    exec ":update " .file
    "echo file .' ## '. htdocs
    if strpos == -1
        exec ":silent ! ". l:browsers[a:name] ." file://". file
    else
        let file = substitute(file, htdocs, "http://127.0.0.1:8090/",  "g")
        let file = substitute(file,  '\\', '/',  "g"')
        exec ":silent !  ". l:browsers[a:name] file
    endif
endfunction

nmap <Leader>cr :call ViewInBrowser("cr")<cr>
nmap <Leader>ff :call ViewInBrowser("ff")<cr>

"---------------------------------------------------------------------------
" tern_for_vim
"----------------------------------------------------------------------------
let tern_show_signature_in_pum=1
let tern_show_argument_hints='on_hold'
autocmd FileType javascript nnoremap <leader>d :TernDef<CR>
autocmd FileType javascript setlocal omnifunc=tern#Complete

"
