local M = {
  "nvim-neorg/neorg",
  ft = "norg",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
}

M.config = {
  load = {
    ["core.defaults"] = {},
    ["core.norg.concealer"] = {},
    ["core.norg.completion"] = { config = { engine = "nvim-cmp" } },
  },
}

return M
