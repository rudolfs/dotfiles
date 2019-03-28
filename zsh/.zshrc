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
alias gp='git pull'
alias gb='gb'

gb() {
  if [ -n "$1" ]
  then
    git branch "$1"
  else
    gobr
  fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

[ -f ~/dotfiles/zsh/.zshrc_local ] && source ~/dotfiles/zsh/.zshrc_local
