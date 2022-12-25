return {
  -- Declare keybinds and show possible keymaps on press
  "folke/which-key.nvim",

  -- Configs for nvim's LSP client
  "neovim/nvim-lspconfig",

  -- Colorschemes
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  "rebelot/kanagawa.nvim",

  -- Git / version control
  { "lewis6991/gitsigns.nvim", config = true, lazy = false },

  -- Comment out lines or blocks quickly
  { "numToStr/Comment.nvim", config = true, keys = { "gcc", "gbc", "gc", "gb" } },

  -- Configure LSP for neovim configuration
  { "folke/neodev.nvim", config = true, lazy = false },
}
