---Function run when LSP server connects to a buffer
---@param client table
---@param bufnr integer
return function(client, bufnr)
  -- Print message to ':messages' list
  vim.api.nvim_echo({ { "Connecting LSP client: ", "Title" }, { client.name, "Normal" } }, true, {})
  require('utils.functions').clear_statusline_msg()

  -- Create autocmd that formats file in write
  local augroup_id = vim.api.nvim_create_augroup("LspOnAttach", {})
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_id,
    buffer = bufnr,
    callback = function() vim.lsp.buf.format { async = false } end,
    desc = "Format file on write",
  })

  -- Add LSP-specific keymaps
  require("config.keymaps.lsp")

  -- Show function signature popups in insert mode
  require("lsp_signature").on_attach({ border = "rounded", hint_prefix = " " }, bufnr)
end
