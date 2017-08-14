#!/bin/sh

apps=(
	emacs
	git
	neovim
	npm
	nodejs
	python
)

# Now I am using Fedora
sudo dnf install ${apps[@]}
