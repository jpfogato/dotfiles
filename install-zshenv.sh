#!/usr/bin/env bash
set -e

# Resolve script directory (your dotfiles repo root)
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_FILE="$DOTFILES_DIR/.zshenv"
TARGET_FILE="$HOME/.zshenv"

echo "Dotfiles directory: $DOTFILES_DIR"
echo "Source file:        $SOURCE_FILE"
echo "Target file:        $TARGET_FILE"
echo

# Check if .zshenv exists already
if [ -e "$TARGET_FILE" ] || [ -L "$TARGET_FILE" ]; then
    # If it’s a symlink pointing into the dotfiles repo, remove it safely
    if [ -L "$TARGET_FILE" ] && [[ "$(readlink "$TARGET_FILE")" == "$SOURCE_FILE" ]]; then
        echo "Existing symlink detected. Removing old symlink…"
        rm "$TARGET_FILE"
    else
        echo "ERROR: ~/.zshenv exists and is not a symlink to your dotfiles."
        echo "Refusing to overwrite. Please handle manually."
        exit 1
    fi
fi

# Create new symlink
echo "Creating symlink:"
echo "  $TARGET_FILE → $SOURCE_FILE"
ln -s "$SOURCE_FILE" "$TARGET_FILE"

echo
echo "~/.zshenv installed successfully."

