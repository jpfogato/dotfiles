# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZDOTDIR="$HOME/.config/zsh"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# using zinit as a plugin manager
# we need to set the env variable as such:
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Adds PowerLevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Setup git to use ssh instead of https for cloning repos
git config --global url."git@github.com:".insteadOf "https://github.com/"

# Add zsh plugins
# syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting
# completions
# to check which program this tool offers completes to, check out:
# https://github.com/zsh-user/zsh-completions/tree/master/src
zinit light zsh-users/zsh-completions
# autosuggestions
zinit light zsh-users/zsh-autosuggestions
# fzf-tab
# allow for fzf usage when tabbing for autocompletions
zinit light Aloxaf/fzf-tab

# Command history settings
HISTSIZE=5000
HISTFILE=~/.zsh_history # file with history commands
SAVEHIST=$HISTSIZE
HISTDUP=erase # erases duplicates
setopt appendhistory # appends to the hist file, instead of deleting it
setopt sharehistory # shares cmd hist accross all sessions
setopt hist_ignore_space # cmds preceded by " " are not added to hist file
# duplicate handling:
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Added snippets
# from OhMyZsh Plugin (OMZP::)
zinit snippet OMZP::git # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
zinit snippet OMZP::sudo # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo
zinit snippet OMZP::rust # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rust
zinit snippet OMZP::ubuntu # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/ubuntu

# Launch options
# Completions
autoload -U compinit && compinit

# following the documentation...
zinit cdreplay -q

# Styling
# Completions
# lowercase letters matches uppercase ones too when completing
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# colors the ls returns
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# disable completion menu to use fzf's menu
zstyle ':completion:*' menu no
# adds directory content previewing
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'


# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Keybinds
bindkey -e
# makes so that these keybinds are added automatically:
# C-f accept autosuggestion
# C-b moves backwards
# C-f moves forwards 
# C-a to jump to the beginning of the prompt
# C-e to jump to the end of the prompt
# C-r to search commands with fzf
# C-p/C-n cycle back and forward through autocomp history
# adjusted below to search only within the current command
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Aliases
alias ls='ls --color' # adds coloring to ls return
alias c='clear'
alias e='exit'
alias vim='nvim'
alias fd='fdfind'
# pipes the content of the file into fzf who opens a pop-up window and allows the selected
# element to be opened with nvim afterwards
alias v='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs -r nvim'



# Shell integrations
# fzf, rust, etc..
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
source ~/.cargo/env
