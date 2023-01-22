local M = {
  "echasnovski/mini.nvim",
  event = { "BufReadPost", "BufNewFile" },
}

function M.config()
  -- Align text
  require("mini.align").setup()
  -- Autopair delimiters
  require("mini.pairs").setup()
  -- Surround text with delimiters
  require("mini.surround").setup()
end

return M
