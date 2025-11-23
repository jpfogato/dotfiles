#!/bin/bash

# setup needed variables
export XDG_CONFIG_HOME="$HOME/.config"
ZSH_DOT_FILES="$XDG_CONFIG_HOME/zsh"
NVIM_CONFIG_FILES="$XDG_CONFIG_HOME/nvim"
TMUX_TPM_DIR="${HOME}/.tmux/plugins/tpm"
TPM_CATPUCCIN_DIR="${XDG_CONFIG_HOME}/tmux/plugins/catpuccin/tmux"

# source the repo files to the desired paths
# deploys dotfiles for simpler packages to home directory "~/"
stow --verbose --restow --dotfiles --target "$HOME" home_dot_files

# create symlinks to dotfies at ~/.configs
stow --verbose --restow --dotfiles --target "$XDG_CONFIG_HOME" config_files 

# tmux installation
# Download and install tpm if it's not there yet
if [ ! -d "TPM_DIR" ]; then
    mkdir -p "$(dirname $TMUX_TPM_DIR)"
     git clone https://github.com/tmux-plugins/tpm "$TMUX_TPM_DIR"
fi

# Download and install catpuccin if it's not there yet
if [ ! -d "CATPUCCIN_DIR" ]; then
    mkdir -p "$(dirname $TPM_CATPUCCIN_DIR)"
     git clone -b v2.1.3 https://github.com/catppuccin/tmux.git "$TPM_CATPUCCIN_DIR"
fi
