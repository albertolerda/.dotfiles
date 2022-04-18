#!/usr/bin/env sh

# luajit is installed with neovim, if I put it in the list of packages
# to be installed it removes neovim
sudo pkg install git neovim emacs zsh curl lua51-luarocks

# Init rust
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Init zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -f .zshenv ~/.zshenv

# Init neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p ~/.config/nvim
ln -f neovim/init.vim ~/.config/nvim/init.vim
