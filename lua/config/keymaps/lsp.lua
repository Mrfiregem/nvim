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
    r = { vim.lsp.buf.rename, "Rename Variable" },
    a = { vim.lsp.buf.code_action, "Run Code Action" },
  },
}, { prefix = "<leader>" })

wk.register {
  -- Navigate to diagnostic messages
  ["[d"] = { vim.diagnostic.goto_prev, "Goto Previous Diagnostic" },
  ["]d"] = { vim.diagnostic.goto_next, "Goto Next Diagnostic" },
  -- Popup information
  K = { vim.lsp.buf.hover, "Show Symbol Information" },
  ["<c-s>"] = { vim.lsp.buf.signature_help, "List Signature Information" },
  ["<c-t>"] = { vim.diagnostic.open_float, "Show Diagnostic Information" },
  -- Goto functions
  g = {
    D = { vim.lsp.buf.declaration, "Goto Symbol Declaration" },
    d = { vim.lsp.buf.definition, "Goto Symbol Definition" },
    I = { vim.lsp.buf.implementation, "List All Symbol Implementations" },
  },
}

wk.register({
  ["<c-s>"] = { vim.lsp.buf.signature_help, "List Signature Information" },
}, { mode = "s" })
