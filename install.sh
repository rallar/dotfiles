#!/bin/bash
# Dotfiles installation script
# Creates symlinks from home directory to dotfiles

DOTFILES_DIR="$HOME/dotfiles"

echo "Installing dotfiles from $DOTFILES_DIR..."

# Create symlinks
ln -sf "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/bashrc" "$HOME/.bashrc"
ln -sf "$DOTFILES_DIR/vimrc" "$HOME/.vimrc"
ln -sf "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf"

echo "✓ Symlinks created:"
echo "  ~/.zshrc -> $DOTFILES_DIR/zshrc"
echo "  ~/.bashrc -> $DOTFILES_DIR/bashrc"
echo "  ~/.vimrc -> $DOTFILES_DIR/vimrc"
echo "  ~/.tmux.conf -> $DOTFILES_DIR/tmux.conf"

# Check for zsh-autosuggestions
if [[ ! -d "$HOME/.zsh/zsh-autosuggestions" ]]; then
  echo ""
  echo "⚠ Warning: zsh-autosuggestions not found"
  echo "Install with:"
  echo "  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions"
fi

echo ""
echo "Dotfiles installed successfully!"
