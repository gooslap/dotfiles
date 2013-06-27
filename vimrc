"#### General ####
set nocompatible               " be iMproved
let g:is_posix = 1             " vim's default is archaic bourne shell, bring it up to the 90s
let mapleader = ','
let maplocalleader = '	'      " Tab as a local leader

set t_RV= 
set ttymouse=xterm2            " Fix for the mysterious 'c' bug.

set history=256                " Number of things to remember in history.
set shiftround                 " round indent to multiple of 'shiftwidth'

set path=**                    " Search down for files, tags.

"set modeline
"set modelines=5                " default numbers of lines to read for modeline instructions

set autoread

set nobackup
set nowritebackup
set noswapfile                 

set hlsearch                   " highlight search
set ignorecase                 " be case insensitive when searching
set smartcase                  " be case sensitive when input has a capital letter
set incsearch                  " show matches while typing


"#### Formatting ####
set nowrap
set textwidth=0                " Don't wrap lines by default

set tabstop=4                  " tab size eql 2 spaces
set softtabstop=4
set shiftwidth=4               " default shift width for indents
set expandtab                  " replace tabs with ${tabstop} spaces
set smarttab                   

set backspace=indent
set backspace+=eol
set backspace+=start

set autoindent
set cindent
set indentkeys-=0#            " do not break indent on #
set cinkeys-=0#
set cinoptions=:s,ps,ts,cs

"#### Visual ####

set t_Co=256
syntax on

if has('gui_running')
  colorscheme default
else
  colorscheme default
endif

set showmatch                 " Show matching brackets.
set matchtime=2               " Bracket blinking.

set wildmode=longest,list     " At command line, complete longest common string, then list alternatives.

set completeopt+=menuone      " Show matches even with single match.
set completeopt+=preview      " Put extra information in the preview window.

" Disable blinking
autocmd VimEnter * set vb t_vb=

set laststatus=2              " always show status line.
set shortmess=atI             " shortens messages
set showcmd                   " display an incomplete command in statusline

set statusline=%<%f\          " custom statusline
set stl+=[%{&ff}]             " show fileformat
set stl+=%y%m%r%=
set stl+=%-14.(%l,%c%V%)\ %P

set foldenable                " Turn on folding
set foldmethod=marker         " Fold on the marker
set foldlevel=100             " Don't autofold anything (but I can still fold manually)

set foldopen=block,hor,tag    " what movements open folds
set foldopen+=percent,mark
set foldopen+=quickfix

set virtualedit=block


if has('gui_running')
  if has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ 10
  elseif has("gui_win32")
    set guifont=Consolas:h12:cANSI
  endif
  set guioptions=cMg " console dialogs, do not show menu and toolbar
endif


"#### Key Mappings ####

" Toggle display of newlines and tabs
map <silent> <leader>i :set invlist<CR>

" Toggle display of numbers
set nonumber
nnoremap <leader>n :set nonumber!<CR>

if has("win32")
  nnoremap <leader>rs :source ~/_vimrc<CR>
else
  nnoremap <leader>rs :source ~/.vimrc<CR>
endif

" Esc
noremap <leader><leader> <Esc>
noremap <Esc> <NOP>

" Buffers
nnoremap <leader>- :bd<CR>
nnoremap <leader>-- :bd!<CR>

" copy filename 
map <silent> <leader>. :let @+=expand('%:p').':'.line('.')<CR>
" copy path
map <silent> <leader>/ :let @+=expand('%:p:h')<CR>

" Start new line.
map <S-CR> A<CR><ESC>

"Launch file explorer.
map <leader>E :Explore<CR>
map <leader>EE :Vexplore!<CR><C-W>=

" Make Control-direction switch between windows (like C-W h, etc)
nmap <silent> <C-k> <C-W><C-k>
nmap <silent> <C-j> <C-W><C-j>
nmap <silent> <C-h> <C-W><C-h>
nmap <silent> <C-l> <C-W><C-l>

" Window management
nnoremap <leader>q :hide<CR>

" Show active buffers
nnoremap <leader>b :ls<CR>

"#### Plugins ####

" Initialize Vundle
"filetype off
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
"Bundle 'gmarik/vundle'

" Snippets
"Bundle 'msanders/snipmate.vim'
"Bundle 'honza/vim-snippets'

" Git integration
"Bundle 'tpope/vim-git'
"Bundle 'tpope/vim-fugitive'
"nnoremap <leader>W :Gwrite<CR>
"nnoremap <leader>C :Gcommit -v<CR>
"nnoremap <leader>S :Gstatus \| 7<CR>
"inoremap <leader>W <Esc><leader>W
"inoremap <leader>C <Esc><leader>C
"inoremap <leader>S <Esc><leader>S

"Bundle 'sjl/gundo.vim'

"Bundle 'Lokaltog/vim-easymotion'
"let g:EasyMotion_leader_key='<LocalLeader>'

"Bundle 'scrooloose/nerdtree'
"Bundle 'rstacruz/sparkup.git', {'rtp': 'vim/'}
"let g:sparkupExecuteMapping = '<c-e>'
"let g:sparkupNextMapping = '<c-ee>'

"filetype plugin indent on      " Automatically detect file types.

