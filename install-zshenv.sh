#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Real sources from the repo
SRC_ZSHENV="$DOTFILES_DIR/.zshenv"
SRC_ZSHRC="$DOTFILES_DIR/zsh/.zshrc"

TARGET_ZSHENV="$HOME/.zshenv"
TARGET_ZSHRC="$HOME/.zshrc"

timestamp() { date +%s; }

backup_and_remove() {
  local target="$1"

  if [ -L "$target" ]; then
    echo "Removing existing symlink: $target"
    rm -f "$target"
  elif [ -e "$target" ]; then
    local bak="${target}.backup.$(timestamp)"
    echo "Backing up existing file: $target -> $bak"
    mv "$target" "$bak"
  fi
}

create_symlink() {
  local src="$1"
  local dest="$2"

  if [ ! -e "$src" ]; then
    echo "ERROR: Source not found: $src" >&2
    exit 1
  fi

  # If the symlink is already correct, skip
  if [ -L "$dest" ] && [ "$(readlink -f "$dest")" = "$(readlink -f "$src")" ]; then
    echo "OK: Symlink already correct: $dest -> $src"
    return
  fi

  backup_and_remove "$dest"

  echo "Creating symlink: $dest -> $src"
  ln -s "$src" "$dest"
}

echo "Dotfiles dir: $DOTFILES_DIR"
echo

create_symlink "$SRC_ZSHENV" "$TARGET_ZSHENV"
create_symlink "$SRC_ZSHRC"  "$TARGET_ZSHRC"

echo
echo "Done!"
ls -la "$TARGET_ZSHENV" || true
ls -la "$TARGET_ZSHRC"  || true

