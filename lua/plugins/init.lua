local cf = require("utils.checkfor")
return {
  -- Declare keybinds and show possible keymaps on press
  { "folke/which-key.nvim", lazy = true },

  -- Configs for nvim's LSP client
  { "neovim/nvim-lspconfig", event = "BufReadPost" },

  -- Colorschemes
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },

  -- Git / version control
  { "lewis6991/gitsigns.nvim", config = true, cond = cf.in_git_repo, event = "BufReadPost" },

  -- Comment out lines or blocks quickly
  { "numToStr/Comment.nvim", config = true, keys = { "gcc", "gbc", "gc", "gb" } },

  -- Configure LSP for neovim configuration
  { "folke/neodev.nvim", config = true, lazy = false },

  -- Better window navigation functions
  { "mrjones2014/smart-splits.nvim", event = "WinNew" },
}
