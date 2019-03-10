DOTFILES_DIR := $(shell echo $(HOME)/dotfiles)
SHELL        := /bin/sh

all: link

link:
	ln -fs $(DOTFILES_DIR)/zsh/.zshrc $(HOME)/.zshrc
	ln -fs $(DOTFILES_DIR)/rg/.rgignore $(HOME)/.rgignore
	ln -fsh $(DOTFILES_DIR)/nvim $(HOME)/.config/nvim

install:
	brew install fzy
	brew install rg
	brew install gnupg # required by asdf
	npm install -g neovim
