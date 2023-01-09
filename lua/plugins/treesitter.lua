local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "yioneko/nvim-yati" },
}

function M.config()
  require("nvim-treesitter.configs").setup {
    ensure_installed = require("utils.lists").ts_langs,
    highlight = { enable = true },
    indent = { enable = false },
    yati = { enable = true },
  }
end

return M
