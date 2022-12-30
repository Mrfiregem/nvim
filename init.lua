-- Set '<leader>' and '<localleader>' keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Change root folder to git root if possible
require("utils.functions").init_autoroot()

-- Auto-install plugin manager and load plugins
require("config.lazy")

-- Load global options, keymaps, etc.
require("config")

-- LSP server configurations
require("lsp")
