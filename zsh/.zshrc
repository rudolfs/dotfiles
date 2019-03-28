export ZSH="$HOME/.local/share/oh-my-zsh"

if ! [ -d $ZSH ]; then
  git clone https://github.com/robbyrussell/oh-my-zsh.git $ZSH
fi

plugins=(ssh-agent)
source $ZSH/oh-my-zsh.sh

source $HOME/dotfiles/zsh/rudolfs.zsh-theme
ZSH_THEME="rudolfs"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=nvim

alias g='rg -i'
alias sl='ls'
alias v='nvim'
alias vim='nvim'
alias gco='git checkout'

# Git
alias gd='git diff'
alias gc='git commit'
alias gds='git diff --staged'
alias gst='git status'
alias gb='gb'

gb() {
  if [ -n "$1" ]
  then
    git branch "$1"
  else
    git branch | cut -c 3- | fzy | xargs git checkout
  fi
}

# Source FZY from default brew install path
[ -f /usr/local/opt/fzf/shell/key-bindings.zsh ] &&
  source /usr/local/opt/fzf/shell/key-bindings.zsh

source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

[ -f $HOME/dotfiles/zsh/.zshrc_local ] &&
  source $HOME/dotfiles/zsh/.zshrc_local
