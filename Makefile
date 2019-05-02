DOTFILES_DIR := $(shell echo $(HOME)/dotfiles)
SHELL        := /bin/sh

all: link

keyboard:
	cp us_lv_de/us_lv_de.* ~/Library/Keyboard\ Layouts/
	osascript -e "tell application \"System Events\" to log out"

link:
	ln -fs $(DOTFILES_DIR)/zsh/zshrc $(HOME)/.zshrc
	ln -fs $(DOTFILES_DIR)/rg/rgignore $(HOME)/.rgignore
	ln -fsh $(DOTFILES_DIR)/nvim $(HOME)/.config/nvim
	ln -fs $(DOTFILES_DIR)/ruby/irbrc $(HOME)/.irbrc

install:
	chsh -s /bin/zsh
	brew install fzy # for vim
	brew install fzf # for zsh history (fzy screws up CTRL-j)
	brew install rg
	brew install gnupg # required by asdf
	brew install pwgen
	npm install -g neovim
