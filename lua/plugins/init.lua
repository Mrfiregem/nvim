return {
  -- Declare keybinds and show possible keymaps on press
  { "folke/which-key.nvim", lazy = true },

  -- Configs for nvim's LSP client
  { "neovim/nvim-lspconfig", lazy = true },

  -- Colorschemes
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },

  -- Git / version control
  { "lewis6991/gitsigns.nvim", config = true },
}
