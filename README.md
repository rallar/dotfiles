# dotfiles
Collection of dotfiles for macOS and Linux

Simple, clean dotfiles for terminal productivity with vim, tmux, and zsh.

## Features

- **Vim**: Modern configuration with syntax highlighting, line numbers, smart indentation
- **Tmux**: Gruvbox-themed status bar with mouse support and 256-color terminal
- **Zsh**: Custom prompt, vi-mode, intelligent history management, tab completion caching
- **Bash**: Minimal fallback configuration with vi-mode

## Installation

```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The install script creates symlinks from your home directory to the dotfiles.

## Prerequisites

- **Zsh** (recommended shell)
- **Neovim** (aliased as `vim` in zshrc)
- **Neofetch** (optional, for system info display)
- **Tmux** (for terminal multiplexing)

### Optional Plugins

**Zsh-autosuggestions** for command suggestions:
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
```

## Configured Tools

| Tool | Config File | Description |
|------|-------------|-------------|
| Vim | `vimrc` | 2-space tabs, UTF-8, industry colorscheme |
| Tmux | `tmux.conf` | Gruvbox theme, mouse enabled, custom status bar |
| Zsh | `zshrc` | Vi-mode, smart history, case-insensitive completion |
| Bash | `bashrc` | Minimal config with vi-mode |

## Key Features

### Vim
- Vi-compatible mode disabled for modern features
- Relative line numbers
- Smart case-insensitive search
- No backup files, swap files enabled
- 2-space tabs with smart indentation

### Tmux
- 256-color support
- Mouse support enabled
- Gruvbox color scheme (#282828, #ebdbb2, #cc241d)
- Status bar shows session name, uptime, and time
- Reload config with prefix + r

### Zsh
- Vi-mode keybindings
- History: 5000 entries with deduplication
- Case-insensitive tab completion with caching
- OS-specific prompt symbols
- Neofetch runs once per session

## Author

Ralf Allar

Feel free to use and comment.
