---Format buffer and write it
---@param bufnr integer
local function format_write(bufnr)
  vim.lsp.buf.format { async = false }
  vim.api.nvim_buf_call(bufnr, function() vim.cmd("silent! write") end)
end

---comment
---@param client table
---@param bufnr integer
return function(client, bufnr) -- Takes client, buffer_number
  -- Print message to ':messages' list
  vim.api.nvim_echo({ { "Connecting LSP client: ", "Title" }, { client.name, "Normal" } }, true, {})
  vim.api.nvim_echo({ { "" } }, false, {}) -- Clear statusline

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

  -- Add ':FormatWrite' command to buffers with LSP attached
  vim.api.nvim_buf_create_user_command(bufnr, "FormatWrite", function() format_write(bufnr) end, { bar = true })

  -- Show function signature popups in insert mode
  require("lsp_signature").on_attach({ border = "rounded", hint_prefix = " " }, bufnr)
end
