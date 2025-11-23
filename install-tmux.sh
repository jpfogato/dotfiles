# Set the tpm directory
TPM_DIR="${HOME}/.tmux/plugins/tpm"
CATPUCCIN_DIR="${XDG_CONFIG_HOME}/tmux/plugins/catpuccin/tmux}"


mkdir -p ~/.config/tmux/plugins/catppuccin
git clone ~/.config/tmux/plugins/catppuccin/tmux

# Download and install tpm if it's not there yet
if [ ! -d "TPM_DIR" ]; then
    mkdir -p "$(dirname $TPM_DIR)"
     git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi


# Download and install catpuccin if it's not there yet
if [ ! -d "CATPUCCIN_DIR" ]; then
    mkdir -p "$(dirname $CATPUCCIN_DIR)"
     git clone -b v2.1.3 https://github.com/catppuccin/tmux.git "$CATPUCCIN_DIR"
fi
