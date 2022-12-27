local function format_write(bufnr)
  vim.lsp.buf.format { async = false }
  vim.api.nvim_buf_call(bufnr, function() vim.cmd("silent! write") end)
end

return function(_, bufnr) -- Takes client, buffer_number
  -- Add keybindings if LSP is present
  require("config.keymaps.lsp")
  -- Add ':FormatWrite' command to buffers with LSP attached
  vim.api.nvim_buf_create_user_command(bufnr, "FormatWrite", function() format_write(bufnr) end, { bar = true })
end
