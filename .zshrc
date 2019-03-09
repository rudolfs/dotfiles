export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ZSH=/Users/rudolfs/.oh-my-zsh

export EDITOR=nvim
ZSH_THEME="rudolfs"

plugins=(git ssh-agent)

source $ZSH/oh-my-zsh.sh

alias g='rg -i'
alias sl='ls'
alias v='nvim'
alias vim='nvim'
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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
