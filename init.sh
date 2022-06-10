#!/usr/bin/env sh

packages="git neovim emacs zsh curl"
# luajit is installed with neovim, if I put it in the list of packages
# to be installed it removes neovim
case `uname -a` in
	*Ubuntu*) sudo apt install $packages luarocks
	;;
	*BSD*) sudo pkg install $packages lua51-luarocks
	;;
esac
echo "Init rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Init zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -f .zshenv ~/.zshenv

echo "Init node"
sh -c "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm install 16

echo "Init neovim"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim
ln -f neovim/init.vim ~/.config/nvim/init.vim

echo "Init git"
git config --global user.email "albertolerda97@gmail.com"
git config --global user.name "Alberto Lerda"
