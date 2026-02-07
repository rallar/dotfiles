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

# Neovim config
mkdir -p "$HOME/.config/nvim"
ln -sf "$DOTFILES_DIR/init.lua" "$HOME/.config/nvim/init.lua"

echo "✓ Symlinks created:"
echo "  ~/.zshrc -> $DOTFILES_DIR/zshrc"
echo "  ~/.bashrc -> $DOTFILES_DIR/bashrc"
echo "  ~/.vimrc -> $DOTFILES_DIR/vimrc"
echo "  ~/.tmux.conf -> $DOTFILES_DIR/tmux.conf"
echo "  ~/.config/nvim/init.lua -> $DOTFILES_DIR/init.lua"

# Create vim undo directory
if [[ ! -d "$HOME/.vim/undo" ]]; then
  mkdir -p "$HOME/.vim/undo"
  echo ""
  echo "✓ Created vim undo directory: ~/.vim/undo"
fi

# Check for zsh-autosuggestions
if [[ ! -d "$HOME/.zsh/zsh-autosuggestions" ]]; then
  echo ""
  echo "⚠ Warning: zsh-autosuggestions not found"
  echo "Install with:"
  echo "  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions"
fi

echo ""
echo "Dotfiles installed successfully!"
