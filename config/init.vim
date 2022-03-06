set nocompatible

" defaults for vim to match neovim
if has('autocmd')
  filetype plugin indent on
endif

"if has('syntax') && !exist('g:syntax_on')
"  syntax enable
"endif
syntax enable

set autoindent
set autoread
set backspace=indent,eol,start
set complete-=i
set display=lastline
set encoding=utf-8
set formatoptions=tcqj
set history=10000
set hlsearch                    " highlight searched phrases
set incsearch                   " highlight as you type
set langnoremap
set laststatus=2                " always show the status bar on the last window
set listchars=tab:>\ ,trail:-,nbsp:+
set mouse=a
set modelines=5                 " number of lines to check for modeline
set nrformats=hex,bin           " what number formats to consider when using C-A C-X
set sessionoptions-=options     " for :mksession command
set smarttab
set tabpagemax=50
set tags=./tags;,tags
set ttyfast
set viminfo+=!
set wildmenu                    " broader command line completion

" Load matchit.vim, if a newer version isn't already installed.
" Neovim includes matchit.vim as a regular plug-in.
if !exists("g:loaded_matchit") && findfile("plugin/matchit.vim", &runtimepath) ==# ""
  runtime! macros/matchit.vim
endif

"
" start my options
set hidden                      " abandon hidden buffers
set undolevels=800

" UI
set report=0                    " always report # of lines changed for command
set ruler
set scrolloff=1
set sidescroll=3
set splitbelow
set splitright
set showmode
set showmatch                   " show matching brackets
set showcmd

" LINE NUMBERING
set number
"set relativenumber

" number when in insert or focus is lost. relative in command mode
" could instead use Plug 'jeffkreeftmeijer/vim-numbertoggle'
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" INDENTATION
set smartindent
set softtabstop=4
set shiftwidth=4
set tabstop=4
set shiftround                  " round indent to multiple of shiftwidth
set copyindent
set expandtab
set cindent

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
