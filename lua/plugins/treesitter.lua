local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "yioneko/nvim-yati" },
}

function M.config()
  require("nvim-treesitter.configs").setup {
    -- List of language parsers to automatically install
    ensure_installed = require("utils.lists").ts_langs,
    -- Enable modules
    highlight = { enable = true },
    indent = { enable = false },
    yati = { enable = true },
    -- Select text based on treesitter node
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>", -- Normal: Select node uder cursor
        node_incremental = "<CR>", -- Visual: Grow selection to parent node
        scope_incremental = "<C-CR>", -- Visual: Grow selection to parent scope
        node_decremental = "<BS>", -- Visual: Shrink selection to child node
      },
    },
  }
end

return M
