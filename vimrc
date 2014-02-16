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
 
set t_Co=256
syntax on
 
if has('gui_running')
    if has('gui_gtk2')
        set guifont=DejaVu\ Sans\ Mono\ 10
    elseif has('gui_win32')
        set guifont=Consolas:h12:cANSI
    endif
 
    "hide menu and toolbar
    set guioptions=icg
 
    colorscheme default
else
    colorscheme elflord
endif
 
"tabular directory listing
let g:netrw_liststyle=2
 
"set custom hotkey trigger
let mapleader = ','
 
"hide numbers and set toggle key
set nonumber
nnoremap <leader>n :set nonumber!<CR>
 
"disable wrapping and set toggle key
set nowrap
nnoremap <leader>m :set nowrap!<CR>
 
"file browse directory of current file
"(new tab)
nnoremap <leader>a :tabe %:p:h<CR>
 
"file browse directory of current file
"(horizontal split)
nnoremap <leader>s :split %:p:h<CR>
 
"file browse directory of current file
"(vertical split)
nnoremap <leader>d :vsplit %:p:h<CR>
 
"file browse directory of current file
"(current window)
nnoremap <leader>f :e %:p:h<CR>
 
"file browse current working dir
"(new tab)
nnoremap <leader>z :tabe .<CR>
 
"file browse current working dir
"(horizontal split)
nnoremap <leader>x :split .<CR>
 
"file browse current working dir
"(vertical split)
nnoremap <leader>c :vsplit .<CR>
 
"file browse current working dir
"(current window)
nnoremap <leader>v :e .<CR>
 
"generate ctags in working dir
nnoremap <leader>t :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ .<CR>

"navigate between tabs
nnoremap <leader>e :tabprevious<CR>
nnoremap <leader>r :tabnext<CR>
 
"split current window
nnoremap <leader>q :vsplit<CR>
nnoremap <leader>w :split<CR>
 
"switch between windows
nnoremap <leader>h <C-W>h<CR>
nnoremap <leader>j <C-W>j<CR>
nnoremap <leader>k <C-W>k<CR>
nnoremap <leader>l <C-W>l<CR>

