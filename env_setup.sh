#!/usr/bin/env bash
set -e

echo "============================================="
echo "  Neovim Full Environment Setup (Ubuntu)"
echo "============================================="
echo

#---------------------------------------------
# 1. Install system dependencies
#---------------------------------------------
echo "[1/7] Installing build tools and dependencies..."
sudo apt update
sudo apt install -y build-essential cmake gettext libtool libtool-bin autoconf automake pkg-config unzip git curl

#---------------------------------------------
# 2. (Optional) Remove old Neovim
#---------------------------------------------
if command -v nvim >/dev/null 2>&1; then
    echo "[2/7] Removing old Neovim installation..."
    sudo apt purge --autoremove -y neovim || true
fi

#---------------------------------------------
# 3. Build and install latest Neovim from source
#---------------------------------------------
echo "[3/7] Cloning and building Neovim..."
cd /tmp
rm -rf neovim
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo -j"$(nproc)"
sudo make install
cd ..
rm -rf neovim
echo "Neovim installed successfully: $(nvim --version | head -n 1)"

#---------------------------------------------
# 4. Install Rust (nightly toolchain + analyzer)
#---------------------------------------------
echo "[4/7] Installing Rust toolchain..."
if ! command -v cargo >/dev/null 2>&1; then
    curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y
    source "$HOME/.cargo/env"
fi
rustup toolchain install nightly
rustup override set nightly
rustup component add rust-analyzer
echo "Rust installed successfully: $(cargo -V)"

#---------------------------------------------
# 5. Install Lua (latest available)
#---------------------------------------------
echo "[5/7] Installing Lua..."
sudo apt install -y lua5.4 || sudo apt install -y lua5.3 || true

#---------------------------------------------
# 6. Install Node.js 18.x
#---------------------------------------------
echo "[6/7] Installing Node.js..."
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
echo "Node.js installed successfully: $(node -v)"

#---------------------------------------------
# 7. Install Python3 and pip/venv
#---------------------------------------------
echo "[7/7] Installing Python3 + pip + venv..."
sudo apt install -y python3-pip python3-venv
echo "Python installed successfully: $(python3 --version)"

#---------------------------------------------
# Clone Neovim configuration repo
#---------------------------------------------
echo
echo "Cloning Neovim config repo into ~/.config..."
cd ~
if [ ! -d "neovim_config" ]; then
    git clone https://github.com/jpfogato/neovim_config.git
fi
mkdir -p ~/.config
mv -f neovim_config ~/.config/nvim_config
echo "Config placed at ~/.config/nvim_config"

#---------------------------------------------
# Post-installation step for blink.cmp
#---------------------------------------------
echo
echo "Final step: building blink.cmp plugin (requires initial Neovim run)."
echo "Opening Neovim once to trigger plugin installs..."
nvim --headless "+Lazy! sync" +qa || true

if [ -d "$HOME/.local/share/nvim/lazy/blink.cmp" ]; then
    cd "$HOME/.local/share/nvim/lazy/blink.cmp"
    cargo +nightly build --release
    echo "blink.cmp built successfully."
else
    echo "blink.cmp folder not found — run Neovim once manually to install plugins."
fi

echo
echo "============================================="
echo " Neovim environment setup complete!"
echo " Launch Neovim using: nvim"
echo "============================================="

