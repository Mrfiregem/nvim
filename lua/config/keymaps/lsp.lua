local wk = require("which-key")
local format_keymap = {
  function() vim.lsp.buf.format { async = true } end,
  "Format File",
}

wk.register({
  f = format_keymap,
  l = {
    name = "LSP Actions",
    f = format_keymap,
    r = { function() vim.lsp.buf.rename() end, "Rename Variable" },
    a = { function() vim.lsp.buf.code_action() end, "Code Action" },
  },
}, { prefix = "<leader>" })
