return {
  -- Declare keybinds and show possible keymaps on press
  "folke/which-key.nvim",

  -- Configs for nvim's LSP client
  "neovim/nvim-lspconfig",

  -- Colorschemes
  { "catppuccin/nvim", name = "catppuccin" },
  "rebelot/kanagawa.nvim",

  -- Git / version control
  { "lewis6991/gitsigns.nvim", config = true, lazy = false },

  -- Comment out lines or blocks quickly
  { "numToStr/Comment.nvim", config = true, keys = { "gcc", "gbc", "gc", "gb" } },

  -- Configure LSP for neovim configuration
  { "folke/neodev.nvim", config = true, lazy = false },

  -- Better window navigation functions
  "mrjones2014/smart-splits.nvim",
}
