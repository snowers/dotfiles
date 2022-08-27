#---------------------------------------------------------------------------------------------------------------------------------------
#   1.  ENVIRONMENT SETUP
#---------------------------------------------------------------------------------------------------------------------------------------

# Set colors to variables
BLACK="\[\033[0;30m\]"
BLACKB="\[\033[1;30m\]"
RED="\[\033[0;31m\]"
REDB="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
GREENB="\[\033[1;32m\]"
YELLOW="\[\033[0;33m\]"
YELLOWB="\[\033[1;33m\]"
BLUE="\[\033[0;34m\]"
BLUEB="\[\033[1;34m\]"
PURPLE="\[\033[0;35m\]"
PURPLEB="\[\033[1;35m\]"
CYAN="\[\033[0;36m\]"
CYANB="\[\033[1;36m\]"
WHITE="\[\033[0;37m\]"
WHITEB="\[\033[1;37m\]"
RESET="\[\033[0;0m\]"

if [[ -e /usr/local/bin/vim ]]; then
    alias vi="/usr/local/bin/vim"
    alias vim="/usr/local/bin/vim"
fi

if [ ! $(ssh-add -l | grep -o -e id_rsa) ]; then
    ssh-add "$HOME/.ssh/id_rsa" > /dev/null 2>&1
fi

# TODO 
# export DIGITALOCEAN_ACCESS_TOKEN='xxx'
# export GITHUB_TOKEN='xxx'


# Misc Commands
alias resource='source ~/.bash_profile'                                         # Source bash_profile
alias ll='ls -alh'                                                              # List files
alias llr='ls -alhr'                                                            # List files (reverse)
alias lls='ls -alhS'                                                            # List files by size
alias llsr='ls -alhSr'                                                          # List files by size (reverse)
alias lld='ls -alht'                                                            # List files by date
alias lldr='ls -alhtr'                                                          # List files by date (reverse)
alias lldc='ls -alhtU'                                                          # List files by date created
alias lldcr='ls -alhtUr'                                                        # List files by date created (reverse)
h() { history | grep "$1"; }                                                    # Shorthand for `history` with added grepping
alias perm="stat -f '%Lp'"                                                      # View the permissions of a file/dir as a number
alias mkdir='mkdir -pv'                                                         # Make parent directories if needed
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"             # List the file structure of the current directory
alias getsshkey="pbcopy < ~/.ssh/id_rsa.pub"                                    # Copy SSH key to the keyboard
bash-as() { sudo -u $1 /bin/bash; }                                             # Run a bash shell as another user
disk-usage() { du -hs "$@" | sort -nr; }                                        # List disk usage of all the files in a directory (use -hr to sort on server)
dirdiff() { diff -u <( ls "$1" | sort)  <( ls "$2" | sort ); }                  # Compare the contents of 2 directories

# Navigation Shortcuts
alias ..='cl ..'
alias ...='cl ../../'
alias ....='cl ../../../'
alias .....='cl ../../../../'
alias ......='cl ../../../../'
alias .......='cl ../../../../../'
alias ........='cl ../../../../../../'
alias home='clear && cd ~ && ll'                                                # Home directory
alias downloads='clear && cd ~/Downloads && ll'                                 # Downloads directory
cs() { cd "$@" &&  ls; }                                                        # Enter directory and list contents with ls
cl() { cd "$@" && ll; }                                                         # Enter directory and list contents with ll

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

# Functions

ff() { /usr/bin/find . -name "$@" ; }
ffl() { /usr/bin/find . -name '*'"$@"'*' ; }

# Clear a directory
cleardir() {
    while true; do
        read -ep 'Completely clear current directory? [y/N] ' response
        case $response in
            [Yy]* )
                bash -c 'rm -rfv ./*'
                bash -c 'rm -rfv ./.*'
                break;;
            * )
                echo 'Skipped clearing the directory...'
                break;;
        esac
    done
}

mktar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }    # Creates a *.tar.gz archive of a file or folder
mkzip() { zip -r "${1%%/}.zip" "$1" ; }               # Create a *.zip archive of a file or folder

# Run last command with sudo
alias fuck='sudo $(fc -ln -1)'

alias gitstats='git-stats'
alias gits='git status -s'
alias gita='git add -A && git status -s'
alias gitcom='git commit -am'
alias gitacom='git add -A && git commit -am'
alias gitc='git checkout'
alias gitcm='git checkout master'
alias gitcd='git checkout development'
alias gitcgh='git checkout gh-pages'
alias gitb='git branch'
alias gitcb='git checkout -b'
alias gitdb='git branch -d'
alias gitDb='git branch -D'
alias gitdr='git push origin --delete'
alias gitf='git fetch'
alias gitr='git rebase'
alias gitp='git push -u'
alias gitpl='git pull'
alias gitfr='git fetch && git rebase'
alias gitfrp='git fetch && git rebase && git push -u'
alias gitpo='git push -u origin'
alias gitpom='git push -u origin master'
alias gitphm='git push heroku master'
alias gitm='git merge'
alias gitmd='git merge development'
alias gitmm='git merge master'
alias gitcl='git clone'
alias gitclr='git clone --recursive'
alias gitamend='git commit --amend'
alias gitundo='git reset --soft HEAD~1'
alias gitm2gh='git checkout gh-pages && git merge master && git push -u && git checkout master'
alias gitrao='git remote add origin'
alias gitrso='git remote set-url origin'
alias gittrack='git update-index --no-assume-unchanged'
alias gituntrack='git update-index --assume-unchanged'
alias gitpls='git submodule foreach git pull origin master'
alias gitremoveremote='git rm -r --cached'
alias gitcount="git shortlog -sne"
alias gitlog="git log --oneline"
alias gitlog-full="git log --graph --abbrev-commit --decorate --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(dim white) - %an%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset)'"
alias gitlog-changes="git log --oneline --decorate --stat --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(dim white) - %an%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset)'"
gitdbr() { git branch -d "$@" && git push origin --delete "$@"; }
gitupstream() { git branch --set-upstream-to="$@"; }
gitreset() {
    if [ -z "$1" ]; then
        while true; do
            read -ep 'Reset to HEAD? [y/N] ' response
            case $response in
                [Yy]* )
                    bash -c 'git reset --hard HEAD'
                    break;;
                * )
                    echo 'Skipped resetting to HEAD...'
                    break;;
            esac
        done
    else
        while true; do
            read -ep "Reset to $1? [y/N] " response
            case $response in
                [Yy]* )
                    bash -c "git reset --hard $1"
                    break;;
                * )
                    echo "Skipped resetting to $1..."
                    break;;
            esac
        done
    fi
}

gitrinse() {
    if [[ "$1" == "all" ]]; then
        while true; do
            read -ep "Are you sure you want to gitrinse this repo and it's submodules? [y/N] " response
            case $response in
                [Yy]* )
                    git clean -xfd;
                    git submodule foreach --recursive git clean -xfd;
                    git reset --hard;
                    git submodule foreach --recursive git reset --hard;
                    git submodule update --init --recursive;
                    break;;
                * )
                    echo "Skipped gitrinse..."
                    break;;
            esac
        done
    else
        while true; do
            read -ep "Are you sure you want to gitrinse this repo's submodules? [y/N] " response
            case $response in
                [Yy]* )
                    git submodule foreach --recursive git clean -xfd;
                    git submodule foreach --recursive git reset --hard;
                    git submodule update --init --recursive;
                    break;;
                * )
                    echo "Skipped gitrinse..."
                    break;;
            esac
        done
    fi
}

# Bash completion for checking out Git branches
_git_checkout_branch_complete() {
    local cur prev opts
    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}
    opts=$(git branch | cut -c 3-)
    COMPREPLY=( $(compgen -W "$opts" -- $cur) )
}

complete -o nospace -F _git_checkout_branch_complete gitc
complete -o nospace -F _git_checkout_branch_complete gitm
complete -o nospace -F _git_checkout_branch_complete gitdb
complete -o nospace -F _git_checkout_branch_complete gitDb
complete -o nospace -F _git_checkout_branch_complete gitdbr
