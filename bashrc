
#abort if not running interactively
[[ -z "$PS1" ]] && return

#source global definitions
if [[ -f /etc/bashrc ]]; then
    source /etc/bashrc
fi

alias ls='ls -h --color'
alias lx='ls -lXB'         #sort by extension.
alias lk='ls -lSr'         #sort by size, biggest last.
alias lt='ls -ltr'         #sort by date, most recent last.
alias lc='ls -ltcr'        #sort by/show change time,most recent last.
alias lu='ls -ltur'        #sort by/show access time,most recent last.

alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #pipe through 'more'
alias lr='ll -R'           #recursive ls
alias la='ll -A'           #show hidden files
alias tree='tree -Csuh'    #nice alternative to 'recursive ls' ...

#setup manpage colours
export LESS_TERMCAP_mb=$'\E[01;31m'       #begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  #begin bold
export LESS_TERMCAP_me=$'\E[0m'           #end mode
export LESS_TERMCAP_se=$'\E[0m'           #end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    #begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           #end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' #begin underline

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

    PS1="\[${fg_purple}\]\w \[${reset}\]$ "
}

init_prompt




