local wk = require("which-key")
local format_keymap = {
  function() vim.lsp.buf.format { async = true } end,
  "Format File",
}

local leader_keymaps = {
  f = format_keymap,
  l = {
    name = "LSP Actions",
    f = format_keymap,
    r = { vim.lsp.buf.rename, "Rename Variable" },
    a = { vim.lsp.buf.code_action, "Run Code Action" },
  },
}

local normal_keymaps = {
  -- Navigate to diagnostic messages
  ["[d"] = { vim.diagnostic.goto_prev, "Goto Previous Diagnostic" },
  ["]d"] = { vim.diagnostic.goto_next, "Goto Next Diagnostic" },
  -- Popup information
  K = { vim.lsp.buf.hover, "Show Symbol Information" },
  ["<C-s>"] = { vim.lsp.buf.signature_help, "List Signature Information" },
  ["<C-t>"] = { vim.diagnostic.open_float, "Show Diagnostic Information" },
  -- Goto functions
  g = {
    D = { vim.lsp.buf.declaration, "Goto Symbol Declaration" },
    d = { vim.lsp.buf.definition, "Goto Symbol Definition" },
    I = { vim.lsp.buf.implementation, "List All Symbol Implementations" },
    r = { vim.lsp.buf.references, "List All References to Symbol" },
  },
}

wk.register(leader_keymaps, { prefix = "<Leader>" })

wk.register(normal_keymaps)

-- Keymaps used in select and insert mode
wk.register({
  ["<C-s>"] = { vim.lsp.buf.signature_help, "List Signature Information" },
}, { mode = { "s", "i" } })
