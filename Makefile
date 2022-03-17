DOTFILES_DIR := $(shell echo $(HOME)/dotfiles)
SHELL        := /bin/sh

all: link

keyboard:
	cp us_lv_de/us_lv_de.* ~/Library/Keyboard\ Layouts/
	osascript -e "tell application \"System Events\" to log out"

link:
	ln -fs $(DOTFILES_DIR)/zsh/zshrc $(HOME)/.zshrc
	ln -fsh $(DOTFILES_DIR)/nvim $(HOME)/.config/nvim
	ln -fsh $(DOTFILES_DIR)/kitty/kitty.conf $(HOME)/.config/kitty
	ln -fsh $(DOTFILES_DIR)/ssh/config $(HOME)/.ssh/config

install:
	chsh -s /bin/zsh
	brew install fzy # for vim
	brew install fzf # for zsh history (fzy screws up CTRL-j)
	brew install rg
	brew install gnupg # required by asdf
	brew install pwgen
	npm install -g neovim

tweak:
	defaults write -g ApplePressAndHoldEnabled -bool false
	defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
	defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
