<h1>快乐的Coding： 用vim打造最适合自己习惯的IDE</h1>
huangguozhen@outlook.com

##【前言】
----

公欲善其事，必先利其器。一款让自己赏心悦目的IDE能让自己更高效的Coding。
 ![image](https://github.com/huangguozhen/vim-ide/blob/master/img/vim.png)

## 【正文】
<h2>基础配置</h2>
vim的配置文件是.vimrc。位置存放有以下两个地方(对于Uninx系统),通常都是放在 $HOME/.vimrc
```
"$HOME/.vimrc"	
"$HOME/.vim/vimrc"	
```

vim窗口外观，显示字体，操作方式，快捷键，插件属性等都是在.vimrc文件中配置。基础配置详细参考.vimrc中的配置

<h2>插件管理</h2>
vim 自身的插件管理是在 .vim/ 目录中预定义子目录管理所有插件比如，子目录 doc/ 存放插件帮助文档、plugin/ 存放通用插件脚本），
vim 的各插件打包文档中通常也包含上述两个（甚至更多）子目录，用户将插件打包文档中的对应子目录拷贝至 .vim/ 目录即可完成插件的安装。
这种插件管理管理起来比较麻烦。首先在同个目录空间下容易引起命名冲突，其次对于插件的升级，卸载比较麻烦(需要到 doc/ 和 plugin/ 目录
下去逐一删除插件相关文件，容易造成误删，漏删的情况)。
[vim-plug](https://github.com/junegunn/vim-plug.git)很好的解决了这个问题，本文中对插件的管理也正是使用vim-plug来管理。

<h3>安装vim-plug</h3>
[下载 plug.vim](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim) 并拷贝至 ~/.vim/autoload 中

### 配置
```
sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
### 使用
在你的.vimrc中增加vim-plug配置
1. 以 `plug#begin()` 开头
2. 使用 `Plug` 命令列出需要安装的插件
3. `plug#end()` 结束。以此表明增加插件到 `&runtimepath`

#### 例子
```vim

call plug#begin('~/.vim/plugged')

" plugin seoul256
Plug 'junegunn/seoul256.vim'

call plug#end()
```
保存.vimrc，重启vim,在命令模式下输入PlugInstall安装插件, 详细使用参考[vim-plup](https://github.com/junegunn/vim-plug.git)。

<h2>示例配置</h2>
```vim

" 兼容性 {{{
    set nocompatible
"
"   解决 Arrow Key Bug {{{
        if &term[:4] == 'xterm' || &term[:5] == 'screen' || &term[:3] == 'rxvt'
            inoremap <silent> <C-[>OC <RIGHT>
        endif
"   }}}
" }}}


" 插件管理 {{{
    "
    call plug#begin('~/.vim/plugged')
        " General {{{
            Plug 'scrooloose/nerdtree'
            Plug 'jistr/vim-nerdtree-tabs'

            Plug 'bling/vim-airline'
            Plug 'powerline/fonts'
            Plug 'flazz/vim-colorschemes'
            Plug 'bling/vim-bufferline'

            Plug 'jiangmiao/auto-pairs'

            Plug 'ctrlpvim/ctrlp.vim'
            Plug 'tacahiroy/ctrlp-funky'
            Plug 'Lokaltog/vim-easymotion'
        " }}}

        " Programming {{{
            Plug 'scrooloose/syntastic'
            Plug 'scrooloose/nerdcommenter'
            Plug 'tpope/vim-fugitive'
            if executable('ctags')
                Plug 'majutsushi/tagbar'
            endif
        " }}}

        "" PHP {{{
            "Plug 'spf13/PIV'
            "Plug 'arnaud-lb/vim-php-namespace'
            "Plug 'beyondwords/vim-twig'
        "" }}}

        " Javascript {{{
            Plug 'elzr/vim-json'
            Plug 'groenewege/vim-less'
            Plug 'pangloss/vim-javascript'
            Plug 'briancollins/vim-jst'
            Plug 'kchmck/vim-coffee-script'
        " }}}

        " Html {{{
            Plug 'amirh/HTML-AutoCloseTag'
            Plug 'hail2u/vim-css3-syntax'
            Plug 'gorodinskiy/vim-coloresque'
            Plug 'tpope/vim-haml'
        " }}}

        " Snippets & AutoComplete{{{
            "Plug 'Shougo/neocomplete.vim'
            "Plug 'Shougo/neosnippet'
            "Plug 'Shougo/neosnippet-snippets'

            "Plug 'SirVer/ultisnips'
            "Plug 'honza/vim-snippets'
        " }}}

    call plug#end()
" }}}


" 基础配置 {{{
    set background=dark

    filetype plugin indent on           " 自动侦测文件类型
    syntax on                           " 允许使用指定语法高亮配色方案替换默认方案
    scriptencoding utf-8                " 以UTF-8编码打开文件

    set shortmess+=filmnrxoOtT          " 精简一些信息显示，详细选项信息输入:help shortmess了解
    set history=1000                    " 保存历史记录行数
    "set spell                           " 拼写检查
    set hidden                          " 允许不保存切换缓存区 

    " 显示git commit 相关信息
    autocmd FileType gitcommit autocmd! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    " 设置目录 {{{
        set backup                      " 备份文件

        " 撤销相关指数设置
        if has('persistent_undo')
            set undofile
            set undolevels=100
            set undoreload=10000
        endif
    " }}}
" }}}


" 格式化 {{{
    set nowrap                          " 不折行
    set autoindent                      " 自动缩进
    set shiftwidth=4                    " 缩进4个空格
    set expandtab                       " 用空格替代Tab
    set softtabstop=4                   " 4个空格当作一个TAB
    set nojoinspaces                    " 连接不使用两个空格
    set splitright                      " 默认右边打开分割窗口
    set splitbelow                      " 默认下面打开分割窗口
    set pastetoggle=<F12>

    autocmd FileType php,javascript,python,xml,sql autocmd BufWritePre <buffer> call StripTrailingWhitespace()

" }}}


" 定义快捷键映射 {{{
    let mapleader = ','
    let maplocalleader = '_'

    nnoremap <leader>q :q<CR>
    nnoremap <leader>w :write<CR>
    nnoremap <leader>x :x<CR>
    nnoremap <leader>l $
    nnoremap <leader>h ^
    nnoremap <leader>pa %

    noremap j gj
    noremap k gk

    vnoremap < <gv
    vnoremap > >gv
    cmap w!! w !sudo tee % >/dev/null

    inoremap jk <ESC>
    inoremap <ESC> <nop>

    nnoremap <leader>bn :bn<CR>
    nnoremap <leader>bp :bp<CR>

    " Toggle hlsearch
    nnoremap <silent> <leader><leader>c :set invhlsearch<CR>

    " 插件快捷键 {{{
    " }}}

" }}}


" 插件配置 {{{
    " Misc {{{

        if isdirectory(expand("~/.vim/plugged/nerdtree"))
            let g:NERDShutUp = 1
        endif
        if isdirectory(expand("~/.vim/plugged/matchit.zip"))
            let b:match_ignorecase = 1
        endif
    " }}}

    " NerdTree {{{

        if isdirectory(expand("~/.vim/plugged/nerdtree"))
            nmap <leader>nt :NERDTreeToggle<CR>

            let NERDTreeShowBookmarks = 1
            let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
            let NERDTreeChDirMode = 0
            let NERDTreeQuitOnOpen = 1
            let NERDTreeMouseMode = 2
            let NERDTreeShowHidden = 1
            let NERDTreeKeepTreeInNewTab = 1
            let g:nerdtree_tabs_open_on_gui_startup = 0
        endif
    " }}}

    " vim-airline {{{

        if isdirectory(expand("~/.vim/plugged/vim-airline/"))
            if !exists('g:airline_theme')
                let g:airline_theme = 'molokai'
            endif
            if !exists('g_airline_powerline_fonts')
                let g:airline_left_sep = '›'
                let g:airline_right_sep = '‹'
            endif
        endif
    " }}}

    "" PIV {{{

        "if isdirectory(expand("~/.vim/plugged/PIV"))
            "let g:DisableAutoPHPFolding = 0
            "let g:PIVAutoClose = 0
        "endif
    "" }}}


    " EasyMotion {{{

        nmap <leader>/ <Plug>(easymotion-s2)
        xmap <leader>/ <Plug>(easymotion-s2)
        omap <leader>/ <Plug>(easymotion-s2)
        nmap / <Plug>(easymotion-sn)
        xmap / <Plug>(easymotion-sn)
        omap / <Plug>(easymotion-sn)

        nmap / <Plug>(easymotion-tn)
        xmap / <Plug>(easymotion-tn)
        omap / <Plug>(easymotion-tn)
    " }}}



    " AutoCloseTag {{{
        au FileType xhtml,xml,html ru ftplugin/html/autoclosetag.vim
        nnoremap <Leader>ac <Plug>ToggleAutoCloseMappings

    " }}}

    " JSON {{{
        nnoremap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
        let g:vim_json_syntax_conceal = 0
    " }}}

    " Ctrl-P {{{
        if isdirectory(expand("~/.vim/plugged/ctrlp.vim/"))
            let g:ctrlp_working_path_mode = 'ra'
            nnoremap <silent> <D-t> :CtrlP<CR>
            nnoremap <silent> ; :CtrlPMRU<CR>
            let g:ctrlp_custom_ignore = {
                \ 'dir':  '\.git$\|\.hg$\|\.svn$',
                \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

            if executable('ag')
                let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
            elseif executable('ack-grep')
                let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
            elseif executable('ack')
                let s:ctrlp_fallback = 'ack %s --nocolor -f'
            else
                let s:ctrlp_fallback = 'find %s -type f'
            endif
            if exists("g:ctrlp_user_command")
                unlet g:ctrlp_user_command
            endif
            let g:ctrlp_user_command = {
                \ 'types': {
                    \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                \ },
                \ 'fallback': s:ctrlp_fallback
            \ }

            if isdirectory(expand("~/.vim/plugged/ctrlp-funky/"))
                " CtrlP extensions
                let g:ctrlp_extensions = ['funky']

                "funky
                nnoremap <Leader>fu :CtrlPFunky<Cr>
            endif
        endif
    " }}}

    " Fugitive {{{
        if isdirectory(expand("~/.vim/plugged/vim-fugitive/"))
            nnoremap <silent> <leader>gs :Gstatus<CR>
            nnoremap <silent> <leader>gd :Gdiff<CR>
            nnoremap <silent> <leader>gc :Gcommit<CR>
            nnoremap <silent> <leader>gb :Gblame<CR>
            nnoremap <silent> <leader>gl :Glog<CR>
            nnoremap <silent> <leader>gp :Git push<CR>
            nnoremap <silent> <leader>gr :Gread<CR>
            nnoremap <silent> <leader>gw :Gwrite<CR>
            nnoremap <silent> <leader>ge :Gedit<CR>
            " Mnemonic _i_nteractive
            nnoremap <silent> <leader>gi :Git add -p %<CR>
            nnoremap <silent> <leader>gg :SignifyToggle<CR>
        endif
    " }}}

    " Syntastic {{{
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*

        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
    " }}}
" }}}


" Vim 界面设置 {{{

    if has('gui_running')
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        colorscheme solarized
    else
        colorscheme molokai
        let g:molokai_original = 1
        let g:rehash256 = 1
    endif

    set tabpagemax=15                   " 最大显示15个tab页
    set showmode                        " 显示当前模式

    set cursorline                      " 高亮光标所在行
    set cursorcolumn                    " 高亮光标所在列
    highlight clear SignColumn
    highlight clear LineNr

    if ('cmdline_info')
        set ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
        set noshowcmd
    endif

    if has('statusline')
        set laststatus=2
        set statusline=%<%f\            " 文件名
        set statusline+=%w%h%m%r        " 选项

        " 显示git信息
        set statusline+=%{fugitive#statusline()}

        set statusline+=\ [%{&ff}/%Y]   " 文件类型
        set statusline+=\ [%{getcwd()}] " 当前目录
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " 右对齐
    endif

    set backspace=indent,eol,start
    set linespace=0                     " 行距
    set number                          " 行号
    set showmatch                       " 匹配到对应括号
    set incsearch                       " 实时搜索
    set hlsearch                        " 高亮搜索结果
    set winminheight=0                  " 窗口最小高度
    set ignorecase
    set smartcase

    set wildmenu                        " 命令行补全
    set wildmode=list:longest,full
    set whichwrap=b,s,h,l,<,>,[,]
    set scrolljump=5
    set scrolloff=3
    set foldenable
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " 高亮显示有问题的空白

    " GUI 设置 {{{
        if has('gui_running')
            set guioptions+=c
            set guioptions-=m
            set guioptions-=L
            set guioptions-=b
            set lines=40
            set guifont=Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
        else
            if &term == 'xterm' || &term == 'screen'
                set t_Co=256
            endif
        endif
    " }}}
" }}}


" 自定义函数 {{{

   " 初始化NERDTree插件 {{{

        function! NERDTreeInitAsNeeded()
            redir => bufoutput
            buffers!
            redir END
            let idx = stridx(bufoutput, "NERD_tree")
            if idx > -1
                NERDTreeMirror
                NERDTreeFind
                wincmd l
            endif
        endfunction
    " }}}

    " StripTrailingWhitespace {{{

        function! StripTrailingWhitespace()
            let _s=@/
            let l = line(".")
            let c = col(".")
            %s/\s\+$//e
            let #/=_s
            call cursor(l, c)
        endfunction
    " }}}

    " 定义编辑 Vim 配置文件快捷键 {{{

        function! s:ExpandFilenameAndExecute(command, file)
            execute a:command . " " . expand(a:file, ":p")
        endfunction

        function! s:EditVimrc()
            call <SID>ExpandFilenameAndExecute("vsplit", "~/.vimrc")
        endfunction

        execute "noremap <leader>ev :call <SID>EditVimrc()<CR>"
        execute "noremap <leader>sv :source ~/.vimrc<CR>"
    " }}}

" }}}
```
