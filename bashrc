
# Abort if not running interactively
[[ -z "$PS1" ]] && return

# Source global definitions
if [[ -f /etc/bashrc ]]; then
    source /etc/bashrc
fi

# Directory listing aliases

alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...


# Configure manpage colours

export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# File and string-related functions

# Find file with pattern in name
function ff() 
{ 
    find . -type f -iname '*'"$*"'*' -ls  
}

# Extract from various archive formats
function extract()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}


# Creates an archive (*.tar.gz) from given directory
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

# Make your directories and files access rights sane
function sanitize() { chmod -R u=rwX,g=rX,o= "$@" ; }


init_prompt()
{
    local reset='\e[0m'

    local bright='\e[1m'
    local dim='\e[2m'
    local underline='\e[4m'
    local blink='\e[5m'

    local fg_black='\e[0;30m'
    local fg_red='\e[0;31m'
    local fg_green='\e[0;32m'
    local fg_yellow='\e[0;33m'
    local fg_blue='\e[0;34m'
    local fg_purple='\e[0;35m'
    local fg_cyan='\e[0;36m'
    local fg_white='\e[0;37m'

    local bg_black='\e[40m'
    local bg_red='\e[41m'
    local bg_green='\e[42m'
    local bg_yellow='\e[43m'
    local bg_blue='\e[44m'
    local bg_purple='\e[45m'
    local bg_cyan='\e[46m'
    local bg_white='\e[47m'

    # FG color must occur first
    PS1="\[${fg_white}${bg_blue}\] \u \h \w \[${reset}\]  "
}

init_prompt




