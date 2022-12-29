local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    { "s1n7ax/nvim-window-picker", config = true },
  },
  cmd = "Neotree",
  keys = {
    { "<leader>d", "<cmd>Neotree focus<cr>", desc = "Focus or open Neotree window" },
    { "<leader>D", "<cmd>Neotree reveal<cr>", desc = "Show current file in Neotree" },
  },
  lazy = false,
}

function M.config()
  vim.g.neo_tree_remove_legacy_commands = 1
  vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
  vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
  vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
  vim.fn.sign_define("DiagnosticSignHint", { text = " ", texthl = "DiagnosticSignHint" })
  require("neo-tree").setup { filesystem = { hijack_netrw_behavior = "open_default" } }
end

return M
