local toggle_key = "<c-z>"

local M = {
  "akinsho/toggleterm.nvim",
  keys = { toggle_key },
  cmd = { "ToggleTerm", "ToggleTermToggleAll", "Lazygit" },
}

function M.config()
  -- Set configuration
  require("toggleterm").setup { open_mapping = toggle_key }

  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new {
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    dir = "git_dir",
    on_open = function(term)
      vim.cmd.startinsert { bang = true }
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<cr>", { noremap = true, silent = true })
    end,
  }
  vim.api.nvim_create_user_command("Lazygit", function()
    if require("utils.check").in_git_repo() then
      lazygit:toggle()
    else
      vim.api.nvim_echo({ { "Error: Not in a git repo", "ErrorMsg" } }, true, {})
    end
  end, {})
end

return M
