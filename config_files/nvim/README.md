# Neovim settings repository

This repository holds my Neovim plugins and their settings. 

## Contained plugins:

- sleuth: Auto-detects and sets file indentation.
- which-key: Shows available keybindings in a popup.
- treesitter: Improves syntax highlighting and code parsing.
- oil: File explorer within a Neovim buffer.
- kanagawa: Elegant Japanese-inspired colorscheme.
- treesitter-textobjects: Adds syntax-aware text objects.
- statusline: Customizable status line with file info.
- projects: Auto-detects and manages project roots.
- fzf-lua: Fast fuzzy finder written in Lua.
- lsp (from kickstart.nvim): Language server integration.
- Mason: Installs and manages LSPs, linters, and formatters.
- dressing: Improves input/select UIs.
- rustacean: Enhances Rust development support.
- conform: Unified code formatter.
- blink (requires building from source): Modern autocompletion engine.

# Installation:

Installation can be done automatically via the `env_setup.sh` script, or it can be manually done by following the "Dependencies" section below.

To install automatically first run `./install.sh` from [root](/), then:

```bash
cd ~/.config/nvim
chmod +x env_setup.sh
sudo ./env_setup.sh
```

## Dependencies

### Environment
Will install the building tools for building neovim from source to ensure we get the latest one available for plugin support

```bash
sudo apt update
sudo apt install build-essential cmake gettext libtool libtool-bin autoconf automake pkg-config unzip git
```
**Recomended:** Ensure no remaining Neovim installation is in the system by `sudo apt purge --autoremove neovim`

Download and install Neovim

```bash
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
exec zsh
nvim --version
cd ..
rm -rf neovim
```

### Rust
Required by lsp and blink and lsp support for Rust.
Run the commands below to have the nigtly builds set as default toolchain for Rust

```bash
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
exec zsh
cargo -V
rustup toolchain install nightly
cd ~
rustup override set nightly
rustup show
rustup component add rust-analyzer
```

this should download and install rust, restart the shell and ensure it is in $PATH, then install the nightly builds, and then set it as default rust toolchian

### Lua
Required as it is the language selected for lazy.nvim plugin manager
```bash
sudo apt install lua5.4
```

### Node.js
required by prettier and bash-language-server support

```bash
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install nodejs -y
```

### Python
required for autopep8 python support

```bash
sudo apt install python3-pip -y
sudo apt install python3.12-venv
```

## Post-install 
After installing everything, we will need to compile blink from source as it is failing to do so on install.
Run neovim for the firt time, then close it after all plugins are installed.

```bash
cd ~/.local/share/nvim/lazy/blink.cmp
cargo +nightly build --release
```
