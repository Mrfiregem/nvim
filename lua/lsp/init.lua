local lc = require("lspconfig")
local afn = require("lsp.on_attach")
local cap = require("cmp_nvim_lsp").default_capabilities()

-- Shell scripting
lc.taplo.setup { on_attach = afn, capabilities = cap }

-- Webdev
lc.emmet_ls.setup { on_attach = afn, capabilities = cap }

-- Gamedev
lc.gdscript.setup { on_attach = afn, capabilities = cap }

-- Rust
lc.rust_analyzer.setup { on_attach = afn, capabilities = cap }

-- Python
lc.jedi_language_server.setup { on_attach = afn, capabilities = cap }

-- Lua
lc.sumneko_lua.setup {
  on_attach = afn,
  capabilities = cap,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      completion = { callSnippet = "Replace" },
      telemetry = { enable = false },
      format = { enable = false },
    },
  },
}
lc.teal_ls.setup { on_attach = afn, capabilities = cap }
