# Dotfiles

This repository was setup to help me preserve and port my configuration to a new Debian installation.
At this stage, it contains my personal setup for:

- [Neovim](https://github.com/neovim/neovim/tree/master)
- [Z shell](https://www.zsh.org/)
- [tmux](https://github.com/tmux/tmux)

> **Warning**
>
> Everything you see here will be `stow`ed to either `~/.config` or `~`, so be aware of potential overwrites or problems during symbolic links generation. 

## Dependencies

### Z shell (zsh)
A shell environment alternative to Bash with a lot of cool features and plugins already preconfigured with with [PowerLevel10k](https://github.com/romkatv/powerlevel10k).

### tmux
Terminal manager

### Neovim
My text editor of choice

 > Important
 > 
 > To support the selected plugins and LSP, Neovim must be installed from the latest stable version. Check [nvim's README file](./config_files/nvim/README.md) for installation guide.

## Installation and Setup

Install the dependencies by copying and pasting the command below:

```bash
sudo apt install -y git stow zsh zsh-autosuggestions zsh-syntax-highlighting fzf fd-find tmux build-essential cmake gettext libtool libtool-bin autoconf automake pkg-config unzip nodejs python3-pip python3.12-venv lua5.4 
```

Then clone this repository inside `~/.config/dotfiles`, and run the installation script:

```bash
cd ~/.config
git clone --depth=1 git@github.com:jpfogato/dotfiles.git dotfiles
cd dotfiles
chmod +x install.sh
./install.sh
```

