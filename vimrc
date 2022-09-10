  
" ~/.vimrci 
" Vim config file
" date 2022-09-10
" Created by Molly
"

"""""""""""""""""""""""""""""""""""
"""全局配置"""
"""""""""""""""""""""""""""""""""""

"关闭vi兼容模式"
set nocompatible

"显示行号"
set number

"设置历史记录步数"
set history=1000

"开启相关插件"
"侦测文件类型"
filetype on

"为特定文件类型载入相关缩进"
filetype indent on

"载入文件类型插件"
filetype plugin on

"外部在外部被修改时, 自动更新该文件
set autoread


"带有以下符号的单词不要被换行分割"
set iskeyword+=_,$,@,#,%,-


"通过使用:command命令,告诉文件哪一行被改动过"
set report=0

"""""""""""""""""""""""""""""""
"""字体和颜色"""
"""""""""""""""""""""""""""""""

"自动开启语法高亮"
syntax enable

"设置颜色"
colorscheme desert 

"高亮显示当前行"
set cursorline


"""""""""""""""""""""""""""""""
"""代码折叠功能"""
"""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""
"""文字处理"""
"""""""""""""""""""""""""""""""""""
" 设置所有的Tab和缩进为4个空格
set tabstop=4

" 设定<<和>>命令移动时的宽度为4
set shiftwidth=4

" 使得按退格键时可以一次删除4个空格
set softtabstop=4
set smarttab

" 缩进自动缩进继承前一行的缩进
set autoindent 
set backspace=indent,eol,start

""""""""""""""""""""""""""""""""""
"""Vim界面"""
""""""""""""""""""""""""""""""""""
"增强模式中的命令行自动完成操作"
set wildmenu

"显示标尺"
set ruler

"设置命令行的高度"
set cmdheight=1

"显示行数"
set nonu

"不要图形按钮"
set go=

"高亮显示匹配的括号([{和}])"
set showmatch

"设置魔术"
set magic

"关闭遇到错误时的声音提示"
"关闭错误信息响铃"
set noerrorbells

"关闭使用可视响铃代替呼叫"
set novisualbell

"搜索逐字符高亮"
set hlsearch
set incsearch

"搜索时不区分大小写"
"还可以使用简写（“:set ic”和“:set noic”）"
set ignorecase


"输入的命令显示出来，看的清楚"
set showcmd


""""""""""""""""""""""""""""""""""""
"""编码设置"""
""""""""""""""""""""""""""""""""""""
"设置编码"
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"设置文件编码"
set fileencodings=utf-8

"设置终端编码"
set termencoding=utf-8

"设置语言编码"
set langmenu=zh_CN.UTF-8
set helplang=cn

"""""""""""""""""""""""""""""
"""其他设置"""
"""""""""""""""""""""""""""""
"开启新行时使用智能自动缩进"
set smartindent
set cin
set showmatch

"在处理未保存或只读文件的时候，弹出确认"
set confirm

"隐藏工具栏"
set guioptions-=T

"隐藏菜单栏"
set guioptions-=m

"置空错误铃声的终端代码"
set vb t_vb=

"显示状态栏（默认值为1，表示无法显示状态栏）"
set laststatus=2

"粘贴不换行问题的解决方法"
set pastetoggle=<F9>

"设置背景颜色"
set background=dark

"文件类型自动检测，代码智能补全"
set completeopt=longest,preview,menu

"共享剪切板"
set clipboard+=unnamed

"从不备份"
set nobackup
set noswapfile

"自动保存"
set autowrite

"显示中文帮助"
if version >= 603
   set helplang=cn
   set encoding=utf-8
endif

"设置高亮相关项"
highlight Search ctermbg=black ctermfg=white guifg=white guibg=black


""""""""""""""""""""""""""""""""
"""在shell脚本开头自动增加信息"""
""""""""""""""""""""""""""""""""
"新建.py,.cc,.sh,.java文件，自动插入文件头"
autocmd BufNewFile *.py,*.cc,*.sh,*.java exec ":call SetTitle()"
"定义函数SetTitle，自动插入文件头"
func SetTitle()
    if expand ("%:e") == 'sh'
        call setline(1, "#!/bin/bash")
        call setline(2, "#Author:Molly")
        call setline(4, "#Time:".strftime("%F %T"))
        call setline(5, "#Name:".expand("%"))
        call setline(6, "#Version:V1.0")
        call setline(7, "#Description:This is a production script.")
    endif
endfunc


" ++++++++++++++++++++++ Vundle Plugin +++++++++++++++++++++"
" +
" +

" Vundle 相关配置
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'gmarik/vundle'

"文件树结构"
Plugin 'preservim/nerdtree'

"状态栏"
Plugin 'vim-airline/vim-airline'

"vim 打开最近打开过的文件目录"
"Plugin 'mhinz/vim-startify'

"高亮所有搜索词结果, k/K 打开和取消"
Plugin 'lfv89/vim-interestingwords'

"文件查找功能"
Plugin 'Yggdroot/LeaderF', { 'do': './install.sh' }

"注释功能"
Plugin 'preservim/nerdcommenter'

"Markdown"
Plugin 'gabrielelana/vim-markdown'
Plugin 'iamcco/markdown-preview.nvim' , { 'do': { -> mkdp#util#install() }}

"主题颜色"
" Plugin 'relastle/bluewery.vim'

" All of your Plugins must be added before the following line
call vundle#end()     




let mapleader=";"

""""""""""""""""""""""""""""""
""""""""LeaderF config""""""""
""""""""""""""""""""""""""""""
let g:Lf_ShowDevIcons = 0 

let g:Lf_ShortcutF = "<leader>f"
let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>


" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1

let g:Lf_UseCache = 0


""""""""""""""""""""""""""""""
""""""""NerdTree config"""""""
""""""""""""""""""""""""""""""

map <leader>l :NERDTreeToggle<CR>

" Automatically close NERDTree when you open a file
let NERDTreeQuitOnOpen=1

"打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif

"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


""""""""""""""""""""""""""""""
""""""""Nerd comment""""""""""
""""""""""""""""""""""""""""""

map mm <leader>c<space>

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"

" Custom function
function! ToggleLineNumber()
  if v:version > 703
    set norelativenumber!
  endif
  set nonumber!
endfunction

map <leader>r :call ToggleLineNumber()<CR>
