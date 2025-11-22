# Set the tpm directory
TPM_DIR="${HOME}/.tmux/plugins/tpm"

# Download and install tpm if it's not there yet
if [ ! -d "TPM_DIR" ]; then
    mkdir -p "$(dirname $TPM_DIR)"
     git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi


