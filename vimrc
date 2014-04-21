set nocompatible

" Setup Pathogen
call pathogen#infect()
" call pathogen#helptags()

" Better copy and paste
set pastetoggle=<F2>
" set clipboard=unnammed

syntax on

set hidden                  " useable buffers
set autoread                " autoreload files changed externally

" Long history and undo
set history=700
set undolevels=700

set encoding=utf-8

if has ("gui_running")
    set guioptions-=T
endif

set wildmenu
set ruler

" Vim UI {
    " ignore some formats
"    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.obj,*.bak,*.exe,*.jpg,*.png,*,.gif 
    set splitbelow          " split below
    set splitright          " split right
    set cmdheight=1         " command bar is 1 high
    set modelines=0
    set showmode
    set showcmd
    set number              " show line numbers
"    set lazyredraw          " do not redraw while running macros (much faster)
    set laststatus=2        " show status line
"    set statusline=%t       " tail of the filename
"    set statusline+=%m      " modified flag
"    set statusline+=%r      " readonly flag
"    set statusline+=%y      " filetype
"    set statusline+=%=      " left/right seperator
"    set statusline+=%c,     " cursor column
"    set statusline+=%l/%L   " cursor line/total lines
"    set statusline+=\ %P    " percent through file
" }

" Visual Cues {
    "set colorcolumn=85
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

" Indentation {
    set autoindent
    set smartindent
    set softtabstop=4   " unify
    set shiftwidth=4    " unify
    set tabstop=4       " 
    set shiftround
    set smarttab
    set copyindent      " follow the conventions laid before us
    set expandtab       " do not use tabs
    set cindent

    filetype plugin on  " load filetype plugins
    filetype indent on  " load filetype indents
" }

" Key remaps {
    nnoremap ; :       
    inoremap jk <Esc>   " use jk to get out of insert

    let mapleader = "," " remap leader to comma

    " yay
    cnoremap <C-A> <Home>
    cnoremap <C-E> <End>

    " easier moving between tabs
    map <Leader>n <esc>:tabprevious<CR>
    map <Leader>m <esc>:tabnext<CR>

    " map sort function to a key
    vnoremap <Leader>s :sort<CR>

    " easier moving of code blocks
    " use < and > to move block of code
    vnoremap < <gv " better indentation
    vnoremap > >gv " better indentation

    " Show whitespace
    " MUST be inserted before the colorscheme command
    " autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    " au InsertLeave * match ExtraWhitespace /\s\+$/
    
    " format paragraphs to 80 chars
    vmap Q gq
    nmap Q gqap


    " disable automatic insertion of comment markers
    set fo=cql
    autocmd FileType * set fo-=o fo-=r
" }

" Colorscheme {

 let g:solarized_termtrans=1
 set background=dark     

 call togglebg#map("<F5>")
 colorscheme solarized

" Color scheme
" =============
" set t_Co=256
" color wombat256mod
" color mayansmoke

    set colorcolumn=80
    highlight ColorColumn ctermbg=233
" map <Leader>v :source ~/.vimrc
"}

" Preserve indendation when pasting text from OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Save when losing focus
au FocusLost * :wa

" filetypes
au BufNewFile,BufRead *.cljs setfiletype clojure
au BufNewFile,BufRead *.md setfiletype markdown
au BufNewFile,BufRead *.md setfiletype css

autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" don't automatically wrap text
set nowrap
set fo-=t

" better completion
set wildmode=list:longest

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" scroll by three lines when cursor moves off screen
set scrolloff=3

" backspace bullshit
set backspace=indent,eol,start

" case search
set ignorecase
set smartcase

" Disable backup and swap files - creates too many events
"set nobackup
"set nowritebackup
"set noswapfile

" copy to os x pasteboard
" vmap <C-c> :w !pbcopy<CR>

" ===================================================================
" Python IDE Setup from Martin Brochhaus
" ===================================================================

set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" for python-mode
map <Leader>g :call RopeGoToDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Settings for vim-powerline
" ===========================
set laststatus=2
let g:Powerline_symbols = 'fancy'


" Settings for vim-markdown
" ==========================
" let g:vim_markdown_folding_disabled=1
let g:vim_markdown_initial_foldlevel=1


" Settings for ctrlp
" ===================
let g:ctrlp_max_height = 30

" Improving code completion
set completeopt=longest,menuone


" found here: http://stackoverflow.com/a/2170800/70778
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim
" http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable
