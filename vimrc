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

set statusline=
set statusline+=%1*\[%n]                                  "buffer number
set statusline+=%2*\ %<%F\                                "file path
set statusline+=%1*\ %y\                                  "file type
set statusline+=%1*\ %{''.(&fenc!=''?&fenc:&enc).''}      "encoding
set statusline+=%1*\ %{(&bomb?\",BOM\":\"\")}\            "byte order mark encoding
set statusline+=%1*\ %{&ff}\                              "file format (dos, unix, etc...) 
set statusline+=%1*\ %=\ %l/%L\                           "line number/total lines
set statusline+=%1*\ %02c\                                "column number
set statusline+=%2*\ %m%r%w\                              "modified, readonly, preview
set statusline+=%1*\ %3b\ %3B\                            "character byte/hex value
set statusline+=%2*\ %{strftime(\"%H:%M:%S\")}\           "time
set statusline+=%1*\ %{strftime(\"%a\ %m/%d/%y\")}\           "date
set laststatus=2

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

function! FindHeaderSourceOpposite()
    let name = expand("%:t:r")
    let ext = "." . expand("%:e")
    let dir = expand("%:p:h")

    let header_extensions = [".h",".hpp",".hh",".H",".hp",".hxx",".HPP",".h++",".tcc",""]
    let source_extensions = [".c",".cpp",".cc",".C",".cp",".cxx",".CPP",".c++",".i",".ii"]

    "treat no extension as header file
    let is_header = (index(header_extensions, ext) != -1 || ext == ".")
    let is_source = (index(source_extensions, ext) != -1)

    echo is_header

    let result = ""
    if is_header
        "search for source
        for e in source_extensions
            let result = findfile(name . e, dir)
            if result != ""
                break
            endif
        endfor

    elseif is_source
        "search for header
        for e in header_extensions
            let result = findfile(name . e, dir)
            if result != ""
                break
            endif
        endfor

    else
        echo expand("%:p:t") . " is not a c/c++ source or header file"
    endif

    return result
endfunction

function! HeaderSourceToggle(view_option)
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

"select all
nnoremap <leader>g ggVG

"give syntax highlighting to unknown file types
au BufNewFile,BufRead * if &ft == "" | set ft=cpp | endif


set t_Co=256
syntax on
 
if has("gui_running")
    if has("gui_gtk2")
        set guifont=DejaVu\ Sans\ Mono\ 10
    elseif has("gui_win32")
        set guifont=Consolas:h12:cANSI
    endif
    "hide menu and toolbar
    set guioptions=icg
endif

" Vim color file
" Name:    gentooish.vim
" Author:  Brian Carper<brian@briancarper.net>
" Version: 0.4

set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

hi Normal gui=NONE   guifg=#cccccc   guibg=#191919 ctermfg=252 ctermbg=234
hi IncSearch gui=NONE   guifg=#000000   guibg=#8bff95 term=reverse ctermfg=16 ctermbg=120
hi Search gui=NONE   guifg=#cccccc   guibg=#863132 term=reverse ctermfg=252 ctermbg=95
hi ErrorMsg gui=NONE   guifg=#cccccc   guibg=#863132 term=standout ctermfg=252 ctermbg=95
hi WarningMsg gui=NONE   guifg=#cccccc   guibg=#863132 term=standout ctermfg=252 ctermbg=95
hi ModeMsg gui=NONE   guifg=#cccccc   guibg=NONE term=bold ctermfg=252
hi MoreMsg gui=NONE   guifg=#cccccc   guibg=NONE term=bold ctermfg=252
hi Question gui=NONE   guifg=#cccccc   guibg=NONE term=standout ctermfg=252
hi StatusLine gui=BOLD   guifg=#cccccc   guibg=#333333 term=bold,reverse cterm=bold ctermfg=252 ctermbg=236
hi User1 gui=BOLD   guifg=#999999   guibg=#333333 cterm=bold ctermfg=246 ctermbg=236
hi User2 gui=BOLD   guifg=#8bff95   guibg=#333333 cterm=bold ctermfg=120 ctermbg=236
hi StatusLineNC gui=NONE   guifg=#999999   guibg=#333333 term=reverse cterm=bold ctermfg=240 ctermbg=236
hi VertSplit gui=NONE   guifg=#cccccc   guibg=#333333 term=reverse ctermfg=252 ctermbg=236
hi WildMenu gui=BOLD   guifg=#cf7dff   guibg=#1F0F29 term=standout cterm=bold ctermfg=177 ctermbg=16
hi DiffText gui=NONE   guifg=#000000  guibg=#4cd169 term=reverse ctermfg=16 ctermbg=77
hi DiffChange gui=NONE   guifg=NONE     guibg=#541691 term=bold ctermbg=54
hi DiffDelete gui=NONE   guifg=#cccccc  guibg=#863132 term=bold ctermfg=252 ctermbg=95
hi DiffAdd gui=NONE   guifg=#cccccc  guibg=#306d30 term=bold ctermfg=252 ctermbg=59
hi Cursor gui=NONE   guifg=#000000   guibg=#8bff95 ctermfg=16 ctermbg=120
hi Folded gui=NONE   guifg=#aaa400   guibg=#000000 term=standout ctermfg=142 ctermbg=16
hi FoldColumn gui=NONE   guifg=#cccccc   guibg=#000000 term=standout ctermfg=252 ctermbg=16
hi Directory gui=NONE   guifg=#8bff95   guibg=NONE term=bold ctermfg=120
hi LineNr gui=NONE   guifg=#bbbbbb   guibg=#222222 term=underline ctermfg=250 ctermbg=235
hi NonText gui=NONE   guifg=#555555   guibg=NONE term=bold ctermfg=240
hi SpecialKey gui=NONE   guifg=#6f6f2f   guibg=NONE term=bold ctermfg=58
hi Title gui=NONE   guifg=#9a383a   guibg=NONE term=bold ctermfg=95
hi Comment gui=NONE   guifg=#666666   guibg=NONE term=bold ctermfg=241
hi Constant gui=NONE   guifg=#b8bb00   guibg=NONE term=underline ctermfg=142
hi Boolean gui=NONE   guifg=#00ff00   guibg=NONE ctermfg=46 ctermfg=46
hi String gui=NONE   guifg=#5dff9e   guibg=#0f291a ctermfg=85 ctermbg=16 ctermfg=85 ctermbg=16
hi Error gui=NONE   guifg=#990000   guibg=#000000 term=reverse ctermfg=88 ctermbg=16 term=reverse ctermfg=88 ctermbg=16
hi Identifier gui=NONE   guifg=#4cbbd1   guibg=NONE term=underline ctermfg=74 term=underline ctermfg=74
hi Ignore gui=NONE   guifg=#555555 ctermfg=240 ctermfg=240
hi Number gui=NONE   guifg=#ddaa66   guibg=NONE ctermfg=179 ctermfg=179
hi PreProc gui=NONE   guifg=#9a383a   guibg=NONE term=underline ctermfg=95 term=underline ctermfg=95
hi Special gui=NONE   guifg=#ffcd8b   guibg=NONE term=bold ctermfg=222 term=bold ctermfg=222
hi Statement gui=NONE   guifg=#4cd169   guibg=NONE term=bold ctermfg=77 term=bold ctermfg=77
hi Todo gui=NONE   guifg=#cccccc   guibg=#863132 term=standout ctermfg=252 ctermbg=95 term=standout ctermfg=252 ctermbg=95
hi Type gui=NONE   guifg=#c476f1   guibg=NONE term=underline ctermfg=177 term=underline ctermfg=177
hi Underlined gui=UNDERLINE   guifg=#cccccc   guibg=NONE term=underline cterm=underline ctermfg=252 term=underline cterm=underline ctermfg=252
hi Visual gui=reverse guifg=#6e4287   guibg=#ffffff term=reverse ctermfg=231 ctermbg=60
hi VisualNOS gui=NONE   guifg=#cccccc   guibg=#000000 term=bold,underline ctermfg=252 ctermbg=16
hi CursorLine gui=NONE   guifg=NONE      guibg=#222222 term=underline ctermbg=235
hi CursorColumn gui=NONE   guifg=NONE      guibg=#222222 term=reverse ctermbg=235
hi lispList gui=NONE   guifg=#555555
hi Pmenu gui=NONE   guifg=#cccccc   guibg=#222222 ctermfg=252 ctermbg=235
hi PMenuSel gui=BOLD   guifg=#c476f1   guibg=#000000
hi PmenuSbar gui=NONE   guifg=#cccccc   guibg=#000000 ctermfg=252 ctermbg=16
hi PmenuThumb gui=NONE   guifg=#cccccc   guibg=#333333 ctermfg=252 ctermbg=236
hi SpellBad gui=undercurl guisp=#cc6666 term=reverse cterm=undercurl ctermfg=167
hi SpellRare gui=undercurl guisp=#cc66cc term=reverse cterm=undercurl ctermfg=170
hi SpellLocal gui=undercurl guisp=#cccc66 term=underline cterm=undercurl ctermfg=185
hi SpellCap gui=undercurl guisp=#66cccc term=reverse cterm=undercurl ctermfg=80
hi MatchParen gui=NONE      guifg=#ffffff   guibg=#005500 term=reverse ctermfg=231 ctermbg=22
hi SpecialKey gui=NONE   guifg=#6f6f2f   guibg=NONE term=bold ctermfg=58
hi NonText gui=NONE   guifg=#555555   guibg=NONE term=bold ctermfg=240
hi Directory gui=NONE   guifg=#8bff95   guibg=NONE term=bold ctermfg=120
hi ErrorMsg gui=NONE   guifg=#cccccc   guibg=#863132 term=standout ctermfg=252 ctermbg=95
hi IncSearch gui=NONE   guifg=#000000   guibg=#8bff95 term=reverse ctermfg=16 ctermbg=120
hi Search gui=NONE   guifg=#cccccc   guibg=#863132 term=reverse ctermfg=252 ctermbg=95
hi MoreMsg gui=NONE   guifg=#cccccc   guibg=NONE term=bold ctermfg=252
hi ModeMsg gui=NONE   guifg=#cccccc   guibg=NONE term=bold ctermfg=252
hi LineNr gui=NONE   guifg=#bbbbbb   guibg=#222222 term=underline ctermfg=250 ctermbg=235
hi Question gui=NONE   guifg=#cccccc   guibg=NONE term=standout ctermfg=252
hi StatusLine gui=BOLD   guifg=#cccccc   guibg=#333333 term=bold,reverse cterm=bold ctermfg=252 ctermbg=236
hi StatusLineNC gui=NONE   guifg=#999999   guibg=#333333 term=reverse cterm=bold ctermfg=240 ctermbg=236
hi VertSplit gui=NONE   guifg=#cccccc   guibg=#333333 term=reverse ctermfg=252 ctermbg=236
hi Title gui=NONE   guifg=#9a383a   guibg=NONE term=bold ctermfg=95
hi Visual gui=reverse guifg=#6e4287   guibg=#ffffff term=reverse ctermfg=231 ctermbg=60
hi VisualNOS gui=NONE   guifg=#cccccc   guibg=#000000 term=bold,underline ctermfg=252 ctermbg=16
hi WarningMsg gui=NONE   guifg=#cccccc   guibg=#863132 term=standout ctermfg=252 ctermbg=95
hi WildMenu gui=BOLD   guifg=#cf7dff   guibg=#1F0F29 term=standout cterm=bold ctermfg=177 ctermbg=16
hi Folded gui=NONE   guifg=#aaa400   guibg=#000000 term=standout ctermfg=142 ctermbg=16
hi FoldColumn gui=NONE   guifg=#cccccc   guibg=#000000 term=standout ctermfg=252 ctermbg=16
hi DiffAdd gui=NONE   guifg=#cccccc  guibg=#306d30 term=bold ctermfg=252 ctermbg=59
hi DiffChange gui=NONE   guifg=NONE     guibg=#541691 term=bold ctermbg=54
hi DiffDelete gui=NONE   guifg=#cccccc  guibg=#863132 term=bold ctermfg=252 ctermbg=95
hi DiffText gui=NONE   guifg=#000000  guibg=#4cd169 term=reverse ctermfg=16 ctermbg=77
hi SignColumn  term=standout ctermfg=51 ctermbg=250
hi SignColumn  term=standout ctermfg=51 ctermbg=250
hi TabLine  term=underline cterm=underline ctermbg=248
hi TabLine  term=underline cterm=underline ctermbg=248
hi TabLineSel  term=bold cterm=bold
hi TabLineSel  term=bold cterm=bold
hi TabLineFill  term=reverse ctermfg=234 ctermbg=252
hi TabLineFill  term=reverse ctermfg=234 ctermbg=252
hi CursorColumn gui=NONE   guifg=NONE      guibg=#222222 term=reverse ctermbg=235
hi CursorLine gui=NONE   guifg=NONE      guibg=#222222 term=underline ctermbg=235
hi Cursor gui=NONE   guifg=#000000   guibg=#8bff95 ctermfg=16 ctermbg=120
hi lCursor  ctermfg=234 ctermbg=252
hi lCursor  ctermfg=234 ctermbg=252
hi Normal gui=NONE   guifg=#cccccc   guibg=#191919 ctermfg=252 ctermbg=234
hi Comment gui=NONE   guifg=#666666   guibg=NONE term=bold ctermfg=241
hi Constant gui=NONE   guifg=#b8bb00   guibg=NONE term=underline ctermfg=142
hi Special gui=NONE   guifg=#ffcd8b   guibg=NONE term=bold ctermfg=222 term=bold ctermfg=222
hi Identifier gui=NONE   guifg=#4cbbd1   guibg=NONE term=underline ctermfg=74 term=underline ctermfg=74
hi Statement gui=NONE   guifg=#4cd169   guibg=NONE term=bold ctermfg=77 term=bold ctermfg=77
hi PreProc gui=NONE   guifg=#9a383a   guibg=NONE term=underline ctermfg=95 term=underline ctermfg=95
hi Type gui=NONE   guifg=#c476f1   guibg=NONE term=underline ctermfg=177 term=underline ctermfg=177
hi Underlined gui=UNDERLINE   guifg=#cccccc   guibg=NONE term=underline cterm=underline ctermfg=252 term=underline cterm=underline ctermfg=252
hi Ignore gui=NONE   guifg=#555555 ctermfg=240 ctermfg=240
hi Error gui=NONE   guifg=#990000   guibg=#000000 term=reverse ctermfg=88 ctermbg=16 term=reverse ctermfg=88 ctermbg=16
hi Todo gui=NONE   guifg=#cccccc   guibg=#863132 term=standout ctermfg=252 ctermbg=95 term=standout ctermfg=252 ctermbg=95
hi String gui=NONE   guifg=#5dff9e   guibg=#0f291a ctermfg=85 ctermbg=16 ctermfg=85 ctermbg=16
hi Number gui=NONE   guifg=#ddaa66   guibg=NONE ctermfg=179 ctermfg=179
hi Boolean gui=NONE   guifg=#00ff00   guibg=NONE ctermfg=46 ctermfg=46
hi Special gui=NONE   guifg=#ffcd8b   guibg=NONE term=bold ctermfg=222 term=bold ctermfg=222
hi Identifier gui=NONE   guifg=#4cbbd1   guibg=NONE term=underline ctermfg=74 term=underline ctermfg=74
hi Statement gui=NONE   guifg=#4cd169   guibg=NONE term=bold ctermfg=77 term=bold ctermfg=77
hi PreProc gui=NONE   guifg=#9a383a   guibg=NONE term=underline ctermfg=95 term=underline ctermfg=95
hi Type gui=NONE   guifg=#c476f1   guibg=NONE term=underline ctermfg=177 term=underline ctermfg=177
hi Underlined gui=UNDERLINE   guifg=#cccccc   guibg=NONE term=underline cterm=underline ctermfg=252
hi Ignore gui=NONE   guifg=#555555 ctermfg=240 ctermfg=240
hi Error gui=NONE   guifg=#990000   guibg=#000000 term=reverse ctermfg=88 ctermbg=16 term=reverse ctermfg=88 ctermbg=16
hi Todo gui=NONE   guifg=#cccccc   guibg=#863132 term=standout ctermfg=252 ctermbg=95 term=standout ctermfg=252 ctermbg=95
hi String gui=NONE   guifg=#5dff9e   guibg=#0f291a ctermfg=85 ctermbg=16 ctermfg=85 ctermbg=16
hi Number gui=NONE   guifg=#ddaa66   guibg=NONE ctermfg=179 ctermfg=179
hi Boolean gui=NONE   guifg=#00ff00   guibg=NONE ctermfg=46 ctermfg=46
hi User1 gui=BOLD   guifg=#999999   guibg=#333333 cterm=bold ctermfg=246 ctermbg=236
hi User2 gui=BOLD   guifg=#8bff95   guibg=#333333 cterm=bold ctermfg=120 ctermbg=236
if v:version >= 700
    hi SpellBad gui=undercurl guisp=#cc6666 term=reverse cterm=undercurl ctermfg=167
    hi SpellCap gui=undercurl guisp=#66cccc term=reverse cterm=undercurl ctermfg=80
    hi SpellRare gui=undercurl guisp=#cc66cc term=reverse cterm=undercurl ctermfg=170
    hi SpellLocal gui=undercurl guisp=#cccc66 term=underline cterm=undercurl ctermfg=185
    hi Pmenu gui=NONE   guifg=#cccccc   guibg=#222222 ctermfg=252 ctermbg=235
    hi PmenuSel  cterm=bold ctermfg=177 ctermbg=16
    hi PmenuSel  cterm=bold ctermfg=177 ctermbg=16
    hi PmenuSbar gui=NONE   guifg=#cccccc   guibg=#000000 ctermfg=252 ctermbg=16
    hi PmenuThumb gui=NONE   guifg=#cccccc   guibg=#333333 ctermfg=252 ctermbg=236
    hi MatchParen gui=NONE      guifg=#ffffff   guibg=#005500 term=reverse ctermfg=231 ctermbg=22
endif
