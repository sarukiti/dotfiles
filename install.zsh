#!/usr/bin/env zsh

emulate -L zsh
setopt err_exit pipe_fail

readonly DOTFILES=${0:A:h}

case $OSTYPE in
  darwin*)
    exec "$DOTFILES/install.macOS.zsh"
    ;;
  linux*)
    exec "$DOTFILES/install.ubuntu.zsh"
    ;;
  *)
    print "Unsupported OS: $OSTYPE" >&2
    exit 1
    ;;
esac
