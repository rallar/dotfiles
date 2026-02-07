-- Neovim config - Ralf Allar
--
-- Schlanke Lua-Config basierend auf der vimrc.
-- Settings die in Neovim bereits Default sind wurden weggelassen.
-- -----------------------------------------------

-- Visual
vim.cmd.colorscheme("industry")
vim.opt.background = "dark"
vim.opt.title = true

-- Status line
vim.opt.statusline = "%F%m%r%h%w%=(%{&ff}/%Y) (line %l/%L, col %c)"

-- Wildmenu
vim.opt.wildmode = "full"

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Clear search highlight with Backspace
vim.keymap.set("n", "<BS>", "<cmd>nohlsearch<CR>", { silent = true })

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Display
vim.opt.linebreak = true
vim.opt.wrap = false
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 5
vim.opt.signcolumn = "yes"

-- File handling
vim.opt.fileformats = { "unix", "dos", "mac" }
vim.opt.swapfile = true
vim.opt.backup = false
vim.opt.writebackup = false

-- Tabs & Indentation
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Performance
vim.opt.updatetime = 300

-- Persistent undo (undodir bleibt Neovim-Default: ~/.local/state/nvim/undo)
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

-- System clipboard
vim.opt.clipboard = "unnamedplus"

-- lazy.nvim Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Plugins hier einfuegen, z.B.:
  -- { "neovim/nvim-lspconfig" },
})
