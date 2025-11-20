# Dotfiles

This repository was setup to help me preserve and port my configuration to a new Debian installation.
At this stage, it contains my personal setup for:

- Neovim
- zsh

## Dependencies

### Git
Required if wished to modify and commit settings directly to this repo

```sudo apt install git```

### Stow
A GNU symlink farm manager used to deploy these settings after cloning.

```sudo apt install stow```

### zsh
A shell environment alternative to Bash with a lot of cool features and plugins already preconfigured with OMZ.

```sudo apt install zsh```

### Neovim
My text editor of choice

```sudo apt install neovim```

For additional Neovim dependencies, check `./nvim/README.md`


## Setup
Clone this repository inside `~/.config/dotfiles`, then extract the contents of it using `stow`.

```
cd ~/.config
mkdir dotfiles
cd dotfiles
git clone git@github.com:jpfogato/dotfiles.git .
stow .
```
