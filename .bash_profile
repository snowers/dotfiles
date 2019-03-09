# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# For more highly customized VIM colors
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Environment Variables
export LANG='en_US.UTF-8'

# Golang
export GOPATH="/usr/local/go"
export GOBIN="/usr/local/go/bin"
export PATH=$PATH:$GOBIN

# Python
export PYTHON_LOCAL="$HOME/.local/bin"
export PATH=$PATH:$PYTHON_LOCAL

# Node
export NODE_PATH=/usr/lib/node_modules

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

[ -f ~/.bash_prompt ] && source ~/.bash_prompt
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_local ] && source ~/.bash_local
