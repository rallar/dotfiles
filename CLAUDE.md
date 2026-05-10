# CLAUDE.md — dotfiles

Persönliche Dotfiles von Ralf Allar. Ziel: schlanke, konsistente Terminal-Umgebung auf macOS, Linux/Kali/Debian, WSL und Windows.

## Dateien und Zweck

| Datei | Ziel-Pfad (nach Install) | Beschreibung |
|---|---|---|
| `vimrc` | `~/.vimrc` | Vim-Config: industry-Colorscheme, 2-Space-Tabs, relative Zeilennummern, persistentes Undo |
| `init.lua` | `~/.config/nvim/init.lua` (Linux) / `%LOCALAPPDATA%\nvim\init.lua` (Windows) | Neovim-Config in Lua, basiert auf vimrc-Logik |
| `tmux.conf` | `~/.tmux.conf` | Gruvbox-Statusbar, Maus, vi-Copymodus |
| `zshrc` | `~/.zshrc` | Zsh: vi-Mode, History-Dedup, case-insensitive Completion, fastfetch beim Session-Start |
| `bashrc` | `~/.bashrc` | Minimaler Fallback mit vi-Mode |
| `install.sh` | — | Symlinks setzen + zsh-autosuggestions installieren (Linux/macOS/WSL) |
| `install.ps1` | — | Symlinks setzen (nur vimrc + init.lua), LSP-Install via winget/go/pip (Windows, als Admin ausführen) |

## Neovim (init.lua)

- Erfordert **Neovim 0.11+** (nutzt native LSP-API `vim.lsp.config()` / `vim.lsp.enable()`)
- **lazy.nvim** wird beim ersten Start automatisch geklont
- LSP-Server: `clangd` (C/C++), `gopls` (Go), `pyright` (Python), `lua_ls` (Lua)
- Autocomplete: nvim-cmp mit LSP- und Buffer-Sources
- Treesitter-Parser-Pfad `/usr/lib/nvim` eingetragen (für Debian/Kali-Pakete)
- Kein `lazy-lock.json` im Repo (in `.gitignore`)

## Wichtige Konventionen

- **Colorscheme überall**: `industry` (dunkel) — sowohl in vim als auch nvim
- **Tabs**: 2 Spaces, `expandtab` — in allen Editoren konsistent
- **vi-Keybindings überall**: nvim, vim, zsh (`bindkey -v`), tmux (`mode-keys vi`), bash
- **Kein Backup, Swapfile bleibt an** — bewusste Entscheidung (Semaphor-Funktion)
- **Clipboard**: `unnamedplus` — System-Clipboard ist Standard-Register

## Besonderheiten / nicht offensichtlich

- `vimrc` hat zwei Makros: `@p` wraps Text in ` ```powershell ``` ` und `@c` in ` ```console ``` `
- `zshrc` führt `fastfetch` nur einmal pro Session aus (via `$FASTFETCH_SHOWN`)
- `install.ps1` erstellt unter Windows **nur** Symlinks für `vimrc` und `init.lua` — `zshrc`/`bashrc`/`tmux.conf` werden dort nicht verlinkt (WSL übernimmt das)
- Tmux-Statusbar zeigt Uptime und Uhrzeit; das Nerd-Font-Icon `󰺓` setzt ein Nerd Font voraus

## Plattform-Spezifisches

- **Linux/WSL**: `install.sh` — alle 5 Symlinks, zsh-autosuggestions, optionale LSP-Installation per `apt`/`pip`
- **macOS**: `install.sh` — LSP via Homebrew
- **Windows nativ**: `install.ps1` als Administrator — nur vim/nvim, LSP via winget/go/pip
