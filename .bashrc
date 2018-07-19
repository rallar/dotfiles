# bashrc gets called for non login shells
echo ".bashrc called for non login shells"

# add own path
export PATH="$PATH:~/bin"

# alias
alias l='ls -AlhGF'
alias ll='ls -lAhG'

alias c=clear
alias h=history

# change prompt
export PS1='\033[0;94m\]\!\[\033[0m\] \u:\[\033[0;32m\]\W\[\033[0m\]$ '
