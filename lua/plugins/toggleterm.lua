local M = {
  "akinsho/toggleterm.nvim",
  keys = { [[<c-\>]] },
  cmd = { "ToggleTerm", "ToggleTermToggleAll", "Lazygit" },
}

function M.config()
  -- Set configuration
  require("toggleterm").setup { open_mapping = [[<c-\>]] }

  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new { cmd = "lazygit", hidden = true, direction = "float", dir = "git_dir" }
  vim.api.nvim_create_user_command("Lazygit", function()
    if require("utils.check").in_git_repo() then
      lazygit:toggle()
    else
      vim.api.nvim_echo({ { "Error: Not in a git repo", "ErrorMsg" } }, true, {})
    end
  end, {})
end

return M
