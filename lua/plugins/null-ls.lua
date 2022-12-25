--[[
-- Null-LS: Treat external commands as LSP servers
-- Docs: <https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/doc>
--]]

local M = {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
  local nls = require("null-ls")
  local nb = nls.builtins
  nls.setup {
    on_attach = require("lsp.on_attach"),
    sources = {
      -- Programming
      -- : Bash
      nb.code_actions.shellcheck,
      nb.diagnostics.shellcheck,
      nb.formatting.shfmt,
      -- : Fish
      nb.diagnostics.fish,
      nb.formatting.fish_indent,
      -- : Lua
      nb.formatting.stylua,
      nb.diagnostics.teal,
      -- : Python
      nb.diagnostics.mypy,
      nb.diagnostics.pylint,
      nb.formatting.black,
      nb.formatting.isort,
    },
  }
end

return M
