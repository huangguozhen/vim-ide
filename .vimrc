" update: 2015-10-27 10:30:00
" define the mapleader: <Leader>
let mapleader=","

" turn on file type
filetype on
filetype plugin on

" define custom map key
" defile mapkey to liner-begin & line-end
nmap <Leader>b 0
nmap <Leader>e $

" define to close current split window
nmap <Leader>q :q<CR>
" define to save current split window
nmap <Leader>w :w<CR>
nmap <Leader>x :x<CR>

" switch windows
nnoremap nw <C-W><C-W>
nnoremap <Leader>lw <C-W>l
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>kw <C-W>k
nnoremap <Leader>jw <C-W>j

" goto pair
nmap <Leader>pa %

" realtime search
set incsearch
set ignorecase
set nocompatible
set wildmenu

" not-blink
" set gcr = a:block-blinkon0

" no scroll
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" disable menubar & toolbar
set guioptions-=m
set guioptions-=T

" show status bar
set laststatus=2

" show position fo cursor 
set ruler

" show line number
set number

" highline line & column
set cursorline
set cursorcolumn

" highline search
set hlsearch

" nowrap
set nowrap

syntax enable
syntax on

" smart indent
filetype indent on

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" vim theme
set background=dark
colorscheme molokai
" colorscheme solarized

" vim plugins manage: use vim-plug
"
call plug#begin('~/.vim/plugged')

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
" fzf is a general-purpose command-line fuzzy finder.
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}

call plug#end()

" vim plugin settings
"
"1. nerd_tree: scan project files
nmap <Leader>nt :NERDTreeToggle<CR>                                            
" set width of NERDTree
let NERDTreeWinSize=22
" set position of NERDTree
let NERDTreeWinPos="right"
" show hidden file        
let NERDTreeShowHidden=1
" NERDTree not help info
let NERDTreeMinimalUI=1
" auto delete buffer
let NERDTreeAutoDeleteBuffer=1
