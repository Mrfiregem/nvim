local uc = require("utils.check")
return {
  -- Declare keybinds and show possible keymaps on press
  { "folke/which-key.nvim", lazy = true },

  -- Configs for nvim's LSP client
  { "neovim/nvim-lspconfig", event = "BufReadPost" },

  -- Show LSP function signatures
  { "ray-x/lsp_signature.nvim", lazy = true },

  -- Colorschemes
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },

  -- Git / version control
  { "lewis6991/gitsigns.nvim", config = true, cond = uc.in_git_repo, event = "BufReadPost" },

  -- Comment out lines or blocks quickly
  { "numToStr/Comment.nvim", config = true, keys = { "gcc", "gbc", "gc", "gb" } },

  -- Configure LSP for neovim configuration
  { "folke/neodev.nvim", config = true, cond = uc.in_config_dir },

  -- Better window navigation functions
  { "mrjones2014/smart-splits.nvim", event = "WinNew" },

  -- Auto-close delimiter characters (e.g. ", ', <, etc.)
  { "windwp/nvim-autopairs", config = {}, event = "BufReadPost" },
}
