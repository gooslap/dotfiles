set nocompatible

let mapleader = ','

set shiftround

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

set t_Co=256
syntax on

colorscheme torte

set showmatch
set matchtime=2

set wildmode=longest,list,full

set nonumber
nnoremap <leader>n :set nonumber!<CR>
