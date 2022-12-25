local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- Snippet engine
    { "dcampos/nvim-snippy", dependencies = { "honza/vim-snippets" } },
    -- Completion sources
    "dcampos/cmp-snippy",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    { "mtoohey31/cmp-fish", ft = "fish" },
  },
  event = "BufReadPost",
}

function M.config()
  local cmp = require("cmp")

  cmp.setup {
    snippet = {
      expand = function(args) require("snippy").expand_snippet(args.body) end,
    },
    mapping = cmp.mapping.preset.insert {
      ["<cr>"] = cmp.mapping.confirm { select = false },
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "snippy" },
      { name = "fish" },
    }, {
      { name = "buffer" },
    }),
  }

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
  })
end

return M
