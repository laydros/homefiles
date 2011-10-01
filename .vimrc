set nocompatible

set encoding=utf-8
set modelines=0
set scrolloff=3
set showmode
set number
set visualbell
set ruler
set undofile
set showcmd
set showmatch
set colorcolumn=85

" indent stuff
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set expandtab
set cindent

" searching
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
" map leader-space to clear search highlighting
nnoremap <leader><space> :noh<cr>

" key remaps
nnoremap ; :
inoremap jk <Esc>

" remap leader to comma
let mapleader = ","

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l/%L\ col\ %c)
set laststatus=2

syntax on


