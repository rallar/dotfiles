-- Neovim config - Ralf Allar
--
-- small Lua-Config based on the vimrc.
-- default neovim settings were deleted
-- -----------------------------------------------

-- Visual
vim.opt.termguicolors = true
vim.cmd.colorscheme("industry")
vim.opt.background = "dark"
vim.opt.title = true
vim.opt.showcmd = true

-- open new windows right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Status line
vim.opt.statusline = "%F%m%r%h%w%=(%{&ff}/%Y) (line %l/%L, col %c)"

-- Wildmenu
-- tab completion shows all results
vim.opt.wildmode = "full"

-- Search (ignore case if no upper case in the search)
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

-- System clipboard (use system clipboard)
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

-- LSP server config (Neovim 0.11+ native API)
vim.lsp.config("clangd", {})     -- C/C++
vim.lsp.config("gopls", {})      -- Go
vim.lsp.config("pyright", {})    -- Python
vim.lsp.config("lua_ls", {       -- Lua
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = { library = { vim.env.VIMRUNTIME } },
    },
  },
})
vim.lsp.enable({ "clangd", "gopls", "pyright", "lua_ls" })

-- LSP Keymaps (only when LSP active)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
})

require("lazy").setup({
  -- Autocomplete
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
        }),
      })
    end,
  },
}, {
  -- Treesitter parser path (Debian/Kali packaged parsers)
  performance = {
    rtp = {
      paths = { "/usr/lib/nvim" },
    },
  },
})
