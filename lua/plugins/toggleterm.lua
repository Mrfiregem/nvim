local M = {
  "akinsho/toggleterm.nvim",
  keys = { [[<c-\>]], "<leader>g" },
  cmd = { "ToggleTerm", "ToggleTermToggleAll" },
}

function M.config()
  -- Set configuration
  require("toggleterm").setup { open_mapping = [[<c-\>]] }

  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new { cmd = "lazygit", hidden = true, direction = "float", dir = "git_dir" }
  local function lazygit_toggleterm()
    if require("utils.check").in_git_repo() then lazygit:toggle() end
  end

  vim.keymap.set("n", "<leader>g", lazygit_toggleterm, { noremap = true, silent = true, desc = "Show lazygit" })
end

return M
