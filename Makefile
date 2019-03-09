DOTFILES_DIR := $(shell echo $(HOME)/dotfiles)
SHELL        := /bin/sh

all: link

link:
	ln -fs $(DOTFILES_DIR)/zsh/.zshrc $(HOME)/.zshrc
	ln -fs $(DOTFILES_DIR)/nvim $(HOME)/.config/nvim
