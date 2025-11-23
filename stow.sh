#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

# Symlink packages to home directory "~/"
stow -d "$SCRIPT_DIR" $SCRIPT_DIR/zsh/.zshrc --restow --dotfiles -t "$HOME" dot-zshenv dot-tmux.conf 

# Symlinks to configs dir "~/.configs/"
stow -d "$SCRIPT_DIR" -t "$HOME/.config" nvim --restow

