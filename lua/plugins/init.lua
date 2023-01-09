local uc = require("utils.check")
return {
  -- Colorschemes
  { "catppuccin/nvim", name = "catppuccin", lazy = true },

  -- LSP-related plugins
  -- : Configs for nvim's LSP client
  { "neovim/nvim-lspconfig", event = { "BufReadPost", "BufNewFile" } },
  -- : Show LSP function signatures
  { "ray-x/lsp_signature.nvim", lazy = true },
  -- : Configure LSP for neovim configuration
  { "folke/neodev.nvim", config = true },
  -- : Better looking ui elements (not just LSP)
  { "stevearc/dressing.nvim", lazy = true },

  -- Ease-of-use text plugins
  -- : Comment out lines or blocks quickly
  { "numToStr/Comment.nvim", config = true, keys = { "gcc", "gbc", "gc", "gb" } },
  -- : Auto-close delimiter characters (e.g. ", ', <, etc.)
  { "windwp/nvim-autopairs", config = {}, event = { "BufReadPost", "BufNewFile" } },

  -- Keymaps and command configuration helpers
  -- : Declare keybinds and show possible keymaps on press
  { "folke/which-key.nvim", lazy = true },
  {
    "mrjones2014/legendary.nvim",
    config = { which_key = { auto_register = true } },
    keys = { { "<c-p>", "<cmd>Legendary<cr>", desc = "Show list of all commands tied to a keymap" } },
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Filetype-specific plugins
  -- : Nushell
  { "LhKipp/nvim-nu", config = {}, event = { "BufNewFile", "BufReadPost" } },

  -- Git / version control
  { "lewis6991/gitsigns.nvim", config = true, cond = uc.in_git_repo, event = "BufReadPost" },

  -- Better window navigation functions
  { "mrjones2014/smart-splits.nvim", event = "WinNew" },
}
