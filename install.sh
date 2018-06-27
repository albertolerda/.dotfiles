#!/bin/sh

apps=(
	emacs
	git
	neovim
	npm
	nodejs
	python
	guake
	tmux
	zsh
)

# Now I am using Fedora
sudo dnf install ${apps[@]}

