# dotfiles
Collection of dotfiles for macOS, Linux, and Windows

Simple, clean dotfiles for terminal productivity with vim, tmux, and zsh.

## Features

- **Neovim**: Lua config with native LSP (clangd, gopls, pyright) and autocomplete (nvim-cmp)
- **Vim**: Configuration with syntax highlighting, line numbers, smart indentation
- **Tmux**: Gruvbox-themed status bar with mouse support and 256-color terminal
- **Zsh**: Custom prompt, vi-mode, intelligent history management, tab completion caching
- **Bash**: Minimal fallback configuration with vi-mode

## Installation

### Linux / macOS / WSL

```bash
git clone https://github.com/rallar/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The install script:
- Creates symlinks for all config files
- Auto-installs zsh-autosuggestions
- Detects your platform (Linux, macOS, WSL)
- Optionally installs LSP servers (clangd, gopls, pyright)

### Windows (PowerShell)

Run as Administrator:

```powershell
git clone https://github.com/rallar/dotfiles.git $HOME\dotfiles
cd $HOME\dotfiles
.\install.ps1
```

The PowerShell script:
- Creates symlinks for vimrc and Neovim init.lua
- Optionally installs LSP servers via winget/go/pip

## Prerequisites

- **Zsh** (recommended shell, Linux/macOS)
- **Neovim 0.11+** (aliased as `vim` in zshrc)
- **Fastfetch** (optional, for system info display)
- **Tmux** (for terminal multiplexing)

### LSP Servers (optional, installed by install scripts)

| Server | Language | Linux/WSL | macOS | Windows |
|--------|----------|-----------|-------|---------|
| clangd | C/C++ | `apt install clangd` | `brew install llvm` | `winget install LLVM.LLVM` |
| gopls | Go | `apt install golang-golang-x-tools` | `brew install gopls` | `go install golang.org/x/tools/gopls@latest` |
| pyright | Python | `pip install pyright` | `brew install pyright` | `pip install pyright` |

## Configured Tools

| Tool | Config File | Description |
|------|-------------|-------------|
| Neovim | `init.lua` | Lua config, lazy.nvim, native LSP + autocomplete |
| Vim | `vimrc` | 2-space tabs, UTF-8, industry colorscheme |
| Tmux | `tmux.conf` | Gruvbox theme, mouse enabled, custom status bar |
| Zsh | `zshrc` | Vi-mode, smart history, case-insensitive completion |
| Bash | `bashrc` | Minimal config with vi-mode |

## Key Features

### Neovim
- Lua-based config (init.lua), requires Neovim 0.11+
- lazy.nvim plugin manager (bootstraps on first start)
- Native LSP via `vim.lsp.config()` / `vim.lsp.enable()`: clangd (C/C++), gopls (Go), pyright (Python)
- Autocomplete via nvim-cmp with LSP and buffer sources
- LSP keymaps: `gd` (definition), `gr` (references), `K` (hover), `<leader>rn` (rename), `<leader>ca` (code action)

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
