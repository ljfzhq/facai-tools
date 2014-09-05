"vimrc file, coldfire, yafc18@gmail.com

execute pathogen#infect()
syntax on   " ENable syntax hightlighting
filetype plugin indent on   " Enable filetype plugins

set t_Co=256    " 256 color support

"use solarized color scheme
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized

set nocompatible	" use vim defaults

set expandtab		" use space replace TAB
set tabstop=4
set shiftwidth=4	" numbers of spaces to (auto)indent
set softtabstop=4   " backspace del 4 charac
set backspace=2     " make backspace could del line breaks, indentation and so on

set scrolloff=3
set history=500
set showcmd
set ruler
set nobackup
set autoread		" auto read when file changed from the outside
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gb2312,gbk,gb18030,iso-2022-jp,euc-jp,cp932
set ffs=unix,dos,mac

set hlsearch
set incsearch
set showmatch		" match when indicator is over them

set autoindent 
" set smartindent
" set nocindent

" move by rows, not linenumber
nnoremap j gj   
nnoremap k gk

set number

" Toggle paste mode on and off
set pastetoggle=<leader>p 
