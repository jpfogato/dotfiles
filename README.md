# Dotfiles

This repository was setup to help me preserve and port my configuration to a new Debian installation.
At this stage, it contains my personal setup for:

- neovim
- zsh
- tmux

> **Warning**
>
> Everything you see here will be `stow`ed to either `~/.config` or `~`, so be aware of potential overwrites or problems during symbolic links generation. 

## Dependencies

### Git
Required if wished to modify and commit settings directly to this repo

```bash
sudo apt install git
```

### Stow
A GNU symlink farm manager used to deploy these settings after cloning.

```bash
sudo apt install stow
```

### Zshell (zsh)
A shell environment alternative to Bash with a lot of cool features and plugins already preconfigured with with (PowerLevel10k)[https://github.com/romkatv/powerlevel10k]

```bash
sudo apt install zsh
sudo apt install zsh-autosuggestion zsh-syntax-highlighting
```

### Neovim
My text editor of choice

```bash
sudo apt install neovim
```

For additional Neovim dependencies, check `.config_files/nvim/README.md`

### fzf
Fuzzy text finder

```bash
sudo apt install fzf
```

### fd-find
File finder, better alternative to `fs` for piping folder contents to fzf

```bash
sudo apt isntall fd-find
```

## Setup
Clone this repository inside `~/.config/dotfiles`, then run the installation script.

```bash
cd ~/.config
git clone --depth=1 git@github.com:jpfogato/dotfiles.git dotfiles
cd dotfiles
chmod +x install.sh
```

