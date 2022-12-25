-- Set '<leader>' and '<localleader>' keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Auto-install plugin manager and load plugins
require("config.lazy")

-- Load global options, keymaps, etc.
require("config.options")

-- LSP server configurations
require("lsp")
