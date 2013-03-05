set nocompatible

execute pathogen#infect()
syntax on
filetype plugin indent on

set autoread			" autoreload files changed externally
set hidden              " usable buffers
set encoding=utf-8

set wildmenu
set ruler

" VIM UI {
    " ignore some formats
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.obj,*.bak,*.exe,*.jpg,*.png,*,.gif 
    set splitbelow          " split below
    set splitright          " split right
    set cmdheight=1         " command bar is 1 high
    set modelines=0
    set showmode
    set showcmd
    set number              " show line numbers
"    set lazyredraw          " do not redraw while running macros (much faster)
    set laststatus=2        " show status line
    set statusline=%t       " tail of the filename
    set statusline+=%m      " modified flag
    set statusline+=%r      " readonly flag
    set statusline+=%y      " filetype
    set statusline+=%=      " left/right seperator
    set statusline+=%c,     " cursor column
    set statusline+=%l/%L   " cursor line/total lines
    set statusline+=\ %P    " percent through file
" )

" Indentation {
    set autoindent
    set smartindent
    set softtabstop=4   " unify
    set shiftwidth=4    " unify
    set tabstop=4       " 
    set smarttab
    set copyindent      " follow the conventions laid before us
    set expandtab       " do not use tabs
    set cindent

    filetype plugin on  " load filetype plugins
    filetype indent on  " load filetype indents
" }

" Visual Cues {
    set colorcolumn=85
    if exists('+colorcolumn')
        set colorcolumn=+1      " show a colored column one column from &tw
    endif

    set showmatch   " show matching brackets
    set hlsearch    " highlight searched phrases
    set incsearch   " highlight as you type 
    set report=0    " always report the number of lines changed
"    set list        " show whitespace characters     
    " map leader-space to clear search highlighting
    nnoremap <leader><space> :noh<cr> 
" }

" Key remaps {
    nnoremap ; :       
    inoremap jk <Esc>   " use jk to get out of insert
    " Yank test to the OS X clipboard
    noremap <leader>y "*y
    noremap <leader>yy "*Y

    let mapleader = "," " remap leader to comma
" }

" filetypes
au BufNewFile,BufRead *.cljs setfiletype clojure
au BufNewFile,BufRead *.md setfiletype markdown
au BufNewFile,BufRead *.md setfiletype css

autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" better completion
set wildmode=list:longest


" Preserve indendation when pasting text from OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Save when losing focus
au FocusLost * :wa


" scroll by three lines when cursor moves off screen
set scrolloff=3

" backspace bullshit
set backspace=indent,eol,start

" case search
set ignorecase
set smartcase

if has ("gui_running")
    set guioptions-=T
endif

" copy to os x pasteboard
vmap <C-c> :w !pbcopy<CR>

