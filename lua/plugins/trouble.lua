local M = {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Trouble",
  keys = {
    { "<leader>T", "<cmd>Trouble<cr>", desc = "Show LSP diagnostics" },
  },
}

return M
