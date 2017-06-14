export ZSH=/Users/rudolfs/.oh-my-zsh

ZSH_THEME="rudolfs"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias g='ag'
alias sl='ls'
alias v='vim'
alias gco='git checkout'

# Git
alias gd='git diff'
alias ga='git add -p'
alias gc='git commit'
alias gds='git diff --staged'
alias gst='git status'
alias grp='git pull --rebase && git push'
alias gb='git branch'
alias gp='git pull'
