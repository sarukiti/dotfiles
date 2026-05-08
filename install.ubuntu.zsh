#!/usr/bin/env zsh

emulate -L zsh
setopt err_exit pipe_fail

readonly DOTFILES=${0:A:h}

sudo apt-get update
sudo apt-get install -y \
  build-essential \
  curl \
  git \
  stow \
  unzip

if (( ! $+commands[rustup] )); then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

if (( ! $+commands[claude] )); then
  curl -fsSL https://claude.ai/install.sh | bash
fi

cd "$DOTFILES"
stow nvim zsh git direnv

print
print 'Done! Open a new terminal to apply zsh config.'
