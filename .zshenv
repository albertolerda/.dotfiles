export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$HOME/bin:/usr/local/go/bin"
export GOPATH="$HOME/go"

export PATH="$PATH:$HOME/.local/bin:$HOME/bin/idea/bin"
. "$HOME/.cargo/env"


alias vim=nvim
alias v=nvim
export VISUAL=nvim

eval "$(luarocks51 path --bin)"

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  if [ -x "$(command -v nvr)" ]; then
    alias nvim=nvr
  else
    alias nim='echo "No nesting!"'
  fi
fi
