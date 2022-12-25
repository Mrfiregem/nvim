local function format_write(bufnr)
  vim.lsp.buf.format { async = false }
  vim.api.nvim_buf_call(bufnr, function() vim.cmd("silent! write") end)
end

local F = function(client, bufnr)
  require("config.keymaps.lsp")
  vim.api.nvim_buf_create_user_command(bufnr, "FormatWrite", function() format_write(bufnr) end, {})
end

return F
