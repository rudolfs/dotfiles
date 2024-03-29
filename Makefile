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
	ln -fsh $(DOTFILES_DIR)/starship/starship.toml $(HOME)/.config/starship.toml

install:
	chsh -s /bin/zsh
	brew install fzy # for neovim
	brew install fzf # for zsh history (fzy screws up CTRL-j)
	brew install starship
	brew install rg
	brew install gnupg # required by asdf
	brew install pwgen
	brew install fd  # neovim telescope dep
	brew install duf
	brew install jq
	brew install htop
	brew install tree
	brew install asdf
	brew install git
	brew install tig
	brew install neovim
	yarn global add neovim # required by neovim Node.js provider
	pip3 install pynvim --upgrade # required by neovim health#coc#check

tweak:
	defaults write -g ApplePressAndHoldEnabled -bool false
	defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
	defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
