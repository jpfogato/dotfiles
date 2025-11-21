# export ZDOTDIR="$HOME/.config/zsh"
echo ">>> zshenv loaded" >&2
# loads Rust toolchain
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
