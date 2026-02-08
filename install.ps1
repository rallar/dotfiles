# Dotfiles installation script for Windows (PowerShell)
# Creates symlinks and installs LSP servers
# Requires: Run as Administrator (for symlinks)

#Requires -RunAsAdministrator

$DotfilesDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "Installing dotfiles from $DotfilesDir..." -ForegroundColor Cyan
Write-Host ""

# Symlink helper
function New-Symlink {
    param([string]$Link, [string]$Target)

    if (Test-Path $Link) {
        Remove-Item $Link -Force
    }

    $ParentDir = Split-Path -Parent $Link
    if (-not (Test-Path $ParentDir)) {
        New-Item -ItemType Directory -Path $ParentDir -Force | Out-Null
    }

    New-Item -ItemType SymbolicLink -Path $Link -Target $Target -Force | Out-Null
    Write-Host "  $Link -> $Target"
}

# Create symlinks (only vim + nvim on native Windows)
Write-Host "Creating symlinks..." -ForegroundColor Yellow

New-Symlink -Link "$HOME\.vimrc" -Target "$DotfilesDir\vimrc"

$NvimConfigDir = "$env:LOCALAPPDATA\nvim"
New-Symlink -Link "$NvimConfigDir\init.lua" -Target "$DotfilesDir\init.lua"

Write-Host ""
Write-Host "Symlinks created." -ForegroundColor Green

# Vim undo directory
$VimUndoDir = "$HOME\.vim\undo"
if (-not (Test-Path $VimUndoDir)) {
    New-Item -ItemType Directory -Path $VimUndoDir -Force | Out-Null
    Write-Host ""
    Write-Host "Created vim undo directory: $VimUndoDir" -ForegroundColor Green
}

# LSP server installation (optional)
Write-Host ""
$installLsp = Read-Host "Install LSP servers (clangd, gopls, pyright)? (y/n)"

if ($installLsp -eq "y" -or $installLsp -eq "Y") {
    Write-Host ""
    Write-Host "Installing LSP servers..." -ForegroundColor Yellow

    # clangd via LLVM
    if (-not (Get-Command clangd -ErrorAction SilentlyContinue)) {
        Write-Host "  Installing LLVM (clangd)..."
        winget install LLVM.LLVM --accept-source-agreements --accept-package-agreements
    } else {
        Write-Host "  clangd already installed" -ForegroundColor Green
    }

    # gopls
    if (-not (Get-Command gopls -ErrorAction SilentlyContinue)) {
        if (Get-Command go -ErrorAction SilentlyContinue) {
            Write-Host "  Installing gopls..."
            go install golang.org/x/tools/gopls@latest
        } else {
            Write-Host "  Skipping gopls: Go not installed" -ForegroundColor Red
        }
    } else {
        Write-Host "  gopls already installed" -ForegroundColor Green
    }

    # pyright
    if (-not (Get-Command pyright -ErrorAction SilentlyContinue)) {
        if (Get-Command pip -ErrorAction SilentlyContinue) {
            Write-Host "  Installing pyright..."
            pip install pyright
        } else {
            Write-Host "  Skipping pyright: pip not installed" -ForegroundColor Red
        }
    } else {
        Write-Host "  pyright already installed" -ForegroundColor Green
    }

    Write-Host ""
    Write-Host "LSP server installation complete." -ForegroundColor Green
}

Write-Host ""
Write-Host "Dotfiles installed successfully!" -ForegroundColor Cyan
