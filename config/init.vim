set nocompatible

syntax on

set hidden
set autoread

set history=800
set undolevels=800

set encoding=utf-8

" broader command line completion
set wildmenu

" UI
set report=0                    " always report # of lines changed for command

set ruler
set scrolloff=1
set sidescroll=3
set splitbelow
set splitright
set showmode
set showcmd
set number
"set relativenumber

" number when in insert or focus is lost. relative in command mode
" could instead use Plug 'jeffkreeftmeijer/vim-numbertoggle'
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

set laststatus=2                " always show the status bar on the last window

set showmatch                   " show matching brackets
set hlsearch                    " highlight searched phrases
set incsearch                   " highlight as you type

" INDENTATION
set autoindent
set smartindent
set softtabstop=4
set shiftwidth=4
set tabstop=4
set shiftround                  " round indent to multiple of shiftwidth
set smarttab
set copyindent
set expandtab
set cindent

filetype plugin on
filetype indent on

" VIM-PLUG
call plug#begin('~/.vim/plugged')

Plug 'wellle/context.vim'
Plug 'sheerun/vim-polyglot'
Plug 'jeffkreeftmeijer/vim-dim'
call plug#end()

" colorscheme nord
" in theory dim allows the terminals colors to work
" use colorscheme grim for greyscale

colorscheme dim

" save when losing focus
au FocusLost * :wa

" case search
set ignorecase                  " ignore case for searching
set smartcase                   " but look for case if I search with it


" ensure xterm-256color
set t_Co=256

" ABBREVIATIONS
abbr _lia <li><a href=""></a></li>

" it's a .vimrc file that makes you look like a ninja. it's the absolute
" minimal setup. no colors, no highlights, no messages, no status bar,
" nothing. just text.

"ninja vimrc http://xero.nu
"set nocompatible
"set modelines=0
"set shortmess+=I
"set noshowmode
"set noshowcmd
"set hidden
"set lazyredraw
"set noruler
"set laststatus=0
"syntax off
"filetype off
