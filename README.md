# dotfiles
Collection of dotfiles for macOS and Linux

Simple, clean dotfiles for terminal productivity with vim, tmux, and zsh.

## Features

- **Neovim**: Modern Lua config with lazy.nvim plugin manager, ready for LSP
- **Vim**: Configuration with syntax highlighting, line numbers, smart indentation
- **Tmux**: Gruvbox-themed status bar with mouse support and 256-color terminal
- **Zsh**: Custom prompt, vi-mode, intelligent history management, tab completion caching
- **Bash**: Minimal fallback configuration with vi-mode

## Installation

```bash
git clone https://github.com/rallar/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The install script creates symlinks from your home directory to the dotfiles.

## Prerequisites

- **Zsh** (recommended shell)
- **Neovim** (aliased as `vim` in zshrc)
- **Fastfetch** (optional, for system info display)
- **Tmux** (for terminal multiplexing)

### Optional Plugins

**Zsh-autosuggestions** for command suggestions:
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
```

## Configured Tools

| Tool | Config File | Description |
|------|-------------|-------------|
| Neovim | `init.lua` | Lua config, lazy.nvim bootstrap, industry colorscheme |
| Vim | `vimrc` | 2-space tabs, UTF-8, industry colorscheme |
| Tmux | `tmux.conf` | Gruvbox theme, mouse enabled, custom status bar |
| Zsh | `zshrc` | Vi-mode, smart history, case-insensitive completion |
| Bash | `bashrc` | Minimal config with vi-mode |

## Key Features

### Neovim
- Lua-based config (init.lua)
- lazy.nvim plugin manager (bootstraps on first start)
- Same base settings as Vim config
- Ready for LSP plugin setup

### Vim
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
- Fastfetch runs once per session

## Author

Ralf Allar

Feel free to use and comment.
