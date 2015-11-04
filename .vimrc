" 简介 {{{
"       M
"   huangguozhen@outlook.com
"   工于善其事，必先利其器。
" }}}


" 插件管理 {{{
    "
    call plug#begin('~/.vim/plugged')
        " General {{{
            Plug 'scrooloose/nerdtree'
            Plug 'jistr/vim-nerdtree-tabs'

            Plug 'altercation/vim-colors-solarized'
            Plug 'spf13/vim-colors'
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

        "" Javascript {{{
            "Plug 'elzr/vim-json'
            "Plug 'groenewege/vim-less'
            "Plug 'pangloss/vim-javascript'
            "Plug 'briancollins/vim-jst'
            "Plug 'kchmck/vim-coffee-script'
        "" }}}

        "" Html {{{
            "Plug 'amirh/HTML-AutoCloseTag'
            "Plug 'hail2u/vim-css3-syntax'
            "Plug 'gorodinskiy/vim-coloresque'
            "Plug 'tpope/vim-haml'
        "" }}}

        " Snippets & AutoComplete{{{
            "Plug 'Shougo/neocomplete.vim'
            Plug 'Shougo/neosnippet'
            Plug 'Shougo/neosnippet-snippets'

            Plug 'SirVer/ultisnips'
            Plug 'honza/vim-snippets'
        " }}}

    call plug#end()
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


" 基础配置 {{{
    set background=dark

    filetype plugin indent on           " 自动侦测文件类型
    syntax on                           " 允许使用指定语法高亮配色方案替换默认方案
    scriptencoding utf-8                " 以UTF-8编码打开文件

    set shortmess+=filmnrxoOtT          " 精简一些信息显示，详细选项信息输入:help shortmess了解
    set history=1000                    " 保存历史记录行数
    set spell                           " 拼写检查
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

    " autocmd FileType php,javascript,python,xml,sql autocmd BufWritePre <buffer> call StripTrailingWhitespace()

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
    nnoremap <silent> <leader><leader> :set invhlsearch<CR> 

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
                let g:airline_theme = 'solarized'
            endif
            if !exists('g_airline_powerline_fonts')
                let g:airline_left_sep = '›'
                let g:airline_right_sep = '‹'
            endif
        endif
    " }}}

    " PIV {{{

        if isdirectory(expand("~/.vim/plugged/PIV"))
            let g:DisableAutoPHPFolding = 0
            let g:PIVAutoClose = 0
       endif
    " }}}


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

    " Snippets & AutoComplete {{{

        "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
        " Disable AutoComplPop.
        let g:acp_enableAtStartup = 0
        " Use neocomplete.
        let g:neocomplete#enable_at_startup = 0
        " Use smartcase.
        let g:neocomplete#enable_smart_case = 1
        " Set minimum syntax keyword length.
        let g:neocomplete#sources#syntax#min_keyword_length = 3
        let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

        " Define dictionary.
        let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
           \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

        " Define keyword.
        if !exists('g:neocomplete#keyword_patterns')
            let g:neocomplete#keyword_patterns = {}
        endif
        let g:neocomplete#keyword_patterns['default'] = '\h\w*'

        " Plugin key-mappings.
        inoremap <expr><C-g>     neocomplete#undo_completion()
        inoremap <expr><C-l>     neocomplete#complete_common_string()

        " Recommended key-mappings.
        " <CR>: close popup and save indent.
        inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
        function! s:my_cr_function()
          return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
          " For no inserting <CR> key.
          "return pumvisible() ? "\<C-y>" : "\<CR>"
        endfunction
        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
        " Close popup by <Space>.
        "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

        " AutoComplPop like behavior.
        let g:neocomplete#enable_auto_select = 1

        " Shell like behavior(not recommended).
        "set completeopt+=longest
        "let g:neocomplete#enable_auto_select = 1
        "let g:neocomplete#disable_auto_complete = 1
        "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        " Enable heavy omni completion.
        if !exists('g:neocomplete#sources#omni#input_patterns')
          let g:neocomplete#sources#omni#input_patterns = {}
        endif
        "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

        " For perlomni.vim setting.
        " https://github.com/c9s/perlomni.vim
        let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

        " Plugin key-mappings.
        imap <C-k>     <Plug>(neosnippet_expand_or_jump)
        smap <C-k>     <Plug>(neosnippet_expand_or_jump)
        xmap <C-k>     <Plug>(neosnippet_expand_target)

        " SuperTab like snippets behavior.
        " imap <expr><TAB>
        "  \ pumvisible() ? "\<C-n>" :
        "  \ neosnippet#expandable_or_jumpable() ?
        "  \    "\<TAB>" : "\<Plug>(neosnippet_expand_or_jump 

        smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

        " For conceal markers.
        if has('conceal')
            set conceallevel=2 concealcursor=niv
        endif

        " Enable snipMate compatibility feature.
        let g:neosnippet#enable_snipmate_compatibility = 1

        " Tell Neosnippet about the other snippets
        let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'
    " }}}
" }}}


" Vim 界面设置 {{{

    if filereadable(expand("~/.vim/plugged/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        color solarized
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
        " set statusline+=%{fugitive#statusline()}

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
            set guioptions -= T
            set lines = 40
            set guifont = Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
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
