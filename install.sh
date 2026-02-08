#!/bin/bash
# Dotfiles installation script
# Creates symlinks from home directory to dotfiles
# Supports Linux, macOS, and WSL

set -e

DOTFILES_DIR="$HOME/dotfiles"

# OS detection
OS="$(uname -s)"
case "$OS" in
  Linux*)
    if grep -qi microsoft /proc/version 2>/dev/null; then
      PLATFORM="WSL"
    else
      PLATFORM="Linux"
    fi
    ;;
  Darwin*) PLATFORM="macOS" ;;
  *)       PLATFORM="Unknown" ;;
esac

echo "Installing dotfiles from $DOTFILES_DIR..."
echo "Detected platform: $PLATFORM"
echo ""

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

# Auto-clone zsh-autosuggestions
if [[ ! -d "$HOME/.zsh/zsh-autosuggestions" ]]; then
  echo ""
  echo "Installing zsh-autosuggestions..."
  mkdir -p "$HOME/.zsh"
  git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.zsh/zsh-autosuggestions"
  echo "✓ zsh-autosuggestions installed"
else
  echo ""
  echo "✓ zsh-autosuggestions already installed"
fi

# LSP server installation (optional)
echo ""
read -rp "Install LSP servers (clangd, gopls, pyright)? (y/n) " install_lsp

if [[ "$install_lsp" == "y" || "$install_lsp" == "Y" ]]; then
  echo ""
  echo "Installing LSP servers..."

  case "$PLATFORM" in
    Linux|WSL)
      if ! command -v clangd &>/dev/null; then
        echo "  Installing clangd..."
        sudo apt install -y clangd
      else
        echo "  ✓ clangd already installed"
      fi

      if ! command -v gopls &>/dev/null; then
        echo "  Installing gopls..."
        sudo apt install -y golang-golang-x-tools
      else
        echo "  ✓ gopls already installed"
      fi

      if ! command -v pyright &>/dev/null; then
        echo "  Installing pyright..."
        pip install --break-system-packages pyright 2>/dev/null || pip install pyright
      else
        echo "  ✓ pyright already installed"
      fi
      ;;

    macOS)
      if ! command -v clangd &>/dev/null; then
        echo "  Installing llvm (clangd)..."
        brew install llvm
      else
        echo "  ✓ clangd already installed"
      fi

      if ! command -v gopls &>/dev/null; then
        echo "  Installing gopls..."
        brew install gopls
      else
        echo "  ✓ gopls already installed"
      fi

      if ! command -v pyright &>/dev/null; then
        echo "  Installing pyright..."
        brew install pyright
      else
        echo "  ✓ pyright already installed"
      fi
      ;;

    *)
      echo "  ⚠ Unknown platform, skipping LSP installation"
      ;;
  esac

  echo ""
  echo "✓ LSP server installation complete"
fi

echo ""
echo "Dotfiles installed successfully!"
