local M = {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Trouble",
  keys = {
    { "<Leader>T", "<Cmd>Trouble<cr>", desc = "Show LSP diagnostics" },
  },
}

return M
