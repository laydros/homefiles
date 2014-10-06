set nocompatible

syntax on

set hidden
set autoread

set history=800
set undolevels=800

set encoding=utf-8

set wildmenu
set ruler

set splitbelow
set splitright
set showmode
set showcmd
set number

set showmatch		" show matching brackets
set hlsearch		" highlight searched phrases
set incsearch		" highlight as you type

set report=0		" always report number of lines changed

" Indentation
set autoindent
set smartindent
set softtabstop=4
set shiftwidth=4
set tabstop=4
set shiftround
set smarttab
set copyindent
set expandtab
set cindent

filetype plugin on
filetype indent on

" save when losing focus
au FocusLost * :wa

" case search
set ignorecase
set smartcase

