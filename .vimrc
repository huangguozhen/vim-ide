" 简介 {{{
"       M
"   huangguozhen@outlook.com
"   工于善其事，必先利其器。
" }}}


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
            Plug 'airblade/vim-gitgutter'
            if executable('ctags')
                Plug 'majutsushi/tagbar'
            endif
        " }}}

        "" PHP {{{
            "Plug 'spf13/PIV'
            "Plug 'arnaud-lb/vim-php-namespace'
            "Plug 'beyondwords/vim-twig'
        "" }}}

        " Python {{{
            Plug 'klen/python-mode'
        " }}}

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

        " Markdown {{{
            " shell: [sudo] npm -g install instant-markdown-d
            Plug 'suan/vim-instant-markdown'
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
    let s:maxoff = 50                   " 50个字母后换行

    " 显示git commit 相关信息
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    " 设置目录 {{{
        set backup                      " 备份文件

        " 撤销相关指数设置
        if has('persistent_undo')
            set undofile
            set undolevels=100
            set undoreload=10000
        endif

        set backupdir=~/.vim/backups
        set directory=~/.vim/swaps
        if exists("&undodir")
            set undodir=~/.vim/undo
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

    autocmd FileType php,javascript,python,xml,sql autocmd BufWritePre <buffer> call StripWhitespace()

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

    " Find merge conflict markers
    map <leader>fc /\v^[<\|=>]{7}( .*\|$ )<CR>

    " display all lines with keyword under cursor
    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>]

    noremap <leader>ss :call StripWhitespace()<CR>

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

    " python-mode {{{
        if !has('python') && !has('python3')
            let g:pymode = 0
        endif

        let g:pymode_lint_checkers = ['pyflakes']
        let g:pymode_trim_whitespaces = 0
        let g:pymode_options = 0
        let g:pymode_rope = 0
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

    " Gitgutter {{{
        if isdirectory(expand("~/.vim/plugged/vim-gitgutter/"))
            noremap <leader>g :GitGutterToggle<CR>
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

    " Vim instant markdown {{{
        let g:instant_markdown_slow = 1
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
    set listchars=tab:▸\ ,trail:•,extends:$,nbsp:. " 高亮显示有问题的空白

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

        function! StripWhitespace ()
            let save_cursor = getpos(".")
            let old_query = getreg('/')
            :%s/\s\+$//e
            call setpos('.', save_cursor)
            call setreg('/', old_query)
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
