" 更新于: 2015-10-27 10:30:00
" 定义快捷键前缀: <Leader>
let mapleader=","

" 开启文件类型侦测，并针对不同类型文件加载不同插件 
filetype on
filetype plugin on

" 定义快捷键到行首，行尾
nmap <Leader>b 0
nmap <Leader>e $

" 关闭当前分割窗口 
nmap <Leader>q :q<CR>
" 保存当前分割窗口
nmap <Leader>w :w<CR>
" 保存并退出当前分割窗口
nmap <Leader>x :x<CR>

" 跳转窗口
nnoremap nw <C-W><C-W>
nnoremap <Leader>lw <C-W>l
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>kw <C-W>k
nnoremap <Leader>jw <C-W>j

" 结对符之间跳转
nmap <Leader>pa %

" 开启实时搜索，大小写不敏感，关闭兼容模式，自身命令行模式智能补全
set incsearch
set ignorecase
set nocompatible
set wildmenu

" 禁止光标闪烁 
set gcr=a:block-blinkon0

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 显示状态条
set laststatus=2

" 显示光标当前位置 
set ruler

" 开启行号显示
set number

" 高亮光标所在行和列
set cursorline
set cursorcolumn

" 高亮显示搜索结果
set hlsearch

" 禁止折行
set nowrap

" 开启语法高亮功能，并允许使用指定语法高亮配色方案替换默认方案
syntax enable
syntax on

" 智能缩进
filetype indent on

" 制表符扩展为空格
set expandtab
" 制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" vim 插件管理: 使用 vim-plug
"
call plug#begin('~/.vim/plugged')

" 项目工程管理。(工程文件浏览，标签管理，多文档编辑)
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'majutsushi/tagbar'
Plug 'fholgado/minibufexpl.vim'

" fzf is a general-purpose command-line fuzzy finder.
" Plug 'junegunn/fzf', {'do': 'yes \| ./install' }

" IDE主题配色插件
Plug 'junegunn/seoul256.vim'
" Plug 'junegunn/vim-easy-align'

" 表格模式插件.
Plug 'dhruvasagar/vim-table-mode'

" 前端开发插件
Plug 'mattn/emmet-vim'

call plug#end()

" vim plugin 配置 
"
" 浏览工程文件
nmap <Leader>nt :NERDTreeToggle<CR>                                            
let NERDTreeWinSize=24
let NERDTreeWinPos="left"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

" 标签索引 
let tagbar_left=0  
nnoremap <Leader>tl :TagbarToggle<CR>
let tagbar_width=32 
let g:tagbar_compact=1 
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }

" 文件Tab页配置
map <Leader>bl :MBEToggle<CR>
map <Leader>bn :MBEbn<CR>
map <Leader>bp :MBEbp<CR>

" 主题配置
" Unified color scheme (default: dark)
" colo seoul256

" Light color scheme
" colo seoul256-light

" Switch
" set background=dark
" set background=light

let g:seoul256_background = 236
colo seoul256

"3. easy-align
" vmap <Leader>a <Plug>(EasyAlign)
" nmap <Leader>a <Plug>(EasyAlign)
" if !exists('g:easy_align_delimiters')
"     let g:easy_align_delimiters = {}
" endif
" let g:easy_align_delimiters['#'] = {'pattern': '#', 'ignore_groups': ['String']}

" 表格模式配置
nmap <Leader>tm :TableModeToggle<CR>
let g:table_mode_corner="|"
let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="
