#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

# Symlink packages to home directory "~/"
stow -d "$SCRIPT_DIR" -t "$HOME" .zshenv .tmux.conf $SCRIPT_DIR/zsh/.zshrc

# Symlinks to configs dir "~/.configs/"
stow -d "$SCRIPT_DIR" -t "$HOME/.config" nvim 

