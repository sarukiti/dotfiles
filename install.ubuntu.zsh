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
  unzip \
  direnv \
  zsh

if (( ! $+commands[rustup] )); then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source "$HOME/.cargo/env"
fi

if (( ! $+commands[sheldon] )); then
  cargo install sheldon
fi

if (( ! $+commands[claude] )); then
  curl -fsSL https://claude.ai/install.sh | bash
fi

cd "$DOTFILES"

# Backup Lima-managed (or other existing) .zshrc before stowing
[[ -f "$HOME/.zshrc" && ! -L "$HOME/.zshrc" ]] && mv "$HOME/.zshrc" "$HOME/.zshrc.bak"

stow -t "$HOME" nvim zsh-linux git direnv sheldon

print
print 'Done! Open a new terminal to apply zsh config.'
