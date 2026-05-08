#!/usr/bin/env zsh

emulate -L zsh
setopt err_exit pipe_fail

readonly DOTFILES=${0:A:h}

brew bundle --file="$DOTFILES/Brewfile"

if (( $+commands[nodebrew] )); then
  # 初回は ~/.nodebrew/src 等が無く install が失敗するので、公式のディレクトリ初期化を先に実行する。
  if [[ ! -x $HOME/.nodebrew/current/bin/node ]]; then
    nodebrew setup
    nodebrew install-binary latest
    nodebrew use latest
  fi
fi

if (( ! $+commands[nix] )); then
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --no-confirm
  . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fi

if (( $+commands[nix] )) && ! nix profile list | grep -q nix-direnv; then
  nix profile install nixpkgs#nix-direnv
fi

if (( ! $+commands[rustup] )); then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

if (( ! $+commands[claude] )); then
  curl -fsSL https://claude.ai/install.sh | bash
fi

cd "$DOTFILES"
stow -t "$HOME" nvim ghostty zsh git direnv sheldon

print
print 'Done! Open a new terminal to apply zsh config.'
print
print 'Manual steps:'
print '  - cmd-eikana: https://github.com/ei-show/cmd-eikana/releases (arm64 dmg)'
print '  - cursor: https://cursor.com/download (dmg)'
