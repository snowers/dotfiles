# Check for a locally compiled version of VIM, usually VIM 8
if [[ -e /usr/local/bin/vim ]]; then
    alias vi="/usr/local/bin/vim"
    alias vim="/usr/local/bin/vim"
fi

alias c="clear"
alias rmr="rm -rf"

alias so="source $HOME/.bash_profile"
alias vbp="v ~/.bash_profile"
alias vba="v ~/.bash_aliases"

alias h="cat $HOME/.histlog"
alias ht="tail $HOME/.histlog"
alias h="history"
alias ht="h | tail"
alias hg="h | g"

alias ..="cd .."
alias ...="cd ../.."

# Functions

ff() { /usr/bin/find . -name "$@" ; }
ffl() { /usr/bin/find . -name '*'"$@"'*' ; }
