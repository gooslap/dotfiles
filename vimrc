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
 
"file browse directory of current file in...
"new tab
nnoremap <leader>a :tabe %:p:h<CR>
"horizontal split
nnoremap <leader>s :split %:p:h<CR>
"vertical split
nnoremap <leader>d :vsplit %:p:h<CR>
"current window
nnoremap <leader>f :e %:p:h<CR>
 
"file browse current working dir in...
"new tab
nnoremap <leader>z :tabe .<CR>
"horizontal split
nnoremap <leader>x :split .<CR>
"vertical split
nnoremap <leader>c :vsplit .<CR>
"current window
nnoremap <leader>v :e .<CR>
 
"generate ctags in working dir
nnoremap <leader>t :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ .<CR>

"navigate between tabs
nnoremap <leader>e :tabprevious<CR>
nnoremap <leader>r :tabnext<CR>
 
"split current window
nnoremap <leader>w :vsplit<CR>
nnoremap <leader>q :split<CR>
 
"switch between windows
nnoremap <leader>h <C-W>h<CR>
nnoremap <leader>j <C-W>j<CR>
nnoremap <leader>k <C-W>k<CR>
nnoremap <leader>l <C-W>l<CR>

function FindHeaderSourceOpposite()
    let name = expand("%:t:r")
    let ext = expand("%:e")
    let dir = expand("%:p:h")
    let is_header = (ext == "h" || ext == "hpp")
    let is_source = (ext == "c" || ext == "cpp")

    let result = ""
    if is_header
        "search for source
        let cpp_file = findfile(name . ".cpp", dir)
        let c_file = findfile(name . ".c", dir)

        if cpp_file != ""
            let result = cpp_file
        else
            let result = c_file
        endif
    elseif is_source
        "search for header
        let hpp_file = findfile(name . ".hpp", dir)
        let h_file = findfile(name . ".h", dir)

        if hpp_file != ""
            let result = hpp_file
        else
            let result = h_file
        endif
    else
        echo expand("%:p:t") . " is not a c/c++ source or header file"
    endif

    return result
endfunction

function HeaderSourceToggle(view_option)
    let newfile = FindHeaderSourceOpposite()
    if newfile != ""
        if a:view_option == "hsplit"
            exe "split " . newfile

        elseif a:view_option == "vsplit"
            exe "vsplit " . newfile

        elseif a:view_option == "newtab"
            exe "tabe " . newfile

        elseif a:view_option == "window"
            exe "e " . newfile
        else
            echoerr "view_option invalid"

        endif
    endif
endfunction

"toggle header/source file in...
"new tab
nnoremap <leader>1 :call HeaderSourceToggle("newtab")<CR>
"horizontal split
nnoremap <leader>2 :call HeaderSourceToggle("hsplit")<CR>
"vertical split
nnoremap <leader>3 :call HeaderSourceToggle("vsplit")<CR>
"current window
nnoremap <leader>4 :call HeaderSourceToggle("window")<CR>



