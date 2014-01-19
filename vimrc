set nocompatible

set mouse=a
set mousefocus

set path=**

set nobackup
set nowritebackup
set noswapfile

set hlsearch
set ignorecase
set smartcase
set incsearch

set nowrap
set textwidth=0

set shiftround
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

set backspace=indent,eol,start

set autoindent
set cindent
set indentkeys-=0#
set cinkeys-=0#
set cinoptions=:s,ps,ts,cs

set showmatch
set matchtime=2

set wildmode=longest,list,full


let mapleader = ','

" Hide numbers and set toggle key
set nonumber
nnoremap <leader>n :set nonumber!<CR>

" Disable wrapping and set toggle key
set nowrap
nnoremap <leader>w :set nowrap!<CR>


set t_Co=256
syntax on

if has('gui_running')
    if has('gui_gtk2')
        set guifont=DejaVu\ Sans\ Mono\ 10
    elseif has('gui_win32')
        set guifont=Consolas:h12:cANSI
    endif

    " Hide menu and toolbar
    set guioptions=icgrb

    colorscheme elflord
else
    colorscheme torte
endif







