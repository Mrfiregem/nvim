local wk = require("which-key")

-- '<leader>' keybinds
wk.register({
  [" "] = { "<cmd>nohlsearch<cr>", "Clear Highlight" },
  t = {
    name = "Telescope",
    t = { "<cmd>Telescope<cr>", "Search Builtins" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    g = { "<cmd>Telescope live_grep<cr>", "Grep Files In PWD" },
  },
  cd = { function() vim.cmd.cd(vim.fn.expand("%:p:h")) end, "Set CWD to current file's parent" },
}, { prefix = "<leader>" })

-- Window navigation
local groupid_smart_splits = vim.api.nvim_create_augroup("SmartSplits", {})
vim.api.nvim_create_autocmd("WinNew", {
  group = groupid_smart_splits,
  pattern = "*",
  callback = function()
    local sms = require("smart-splits")
    wk.register {
      -- Resize windows
      ["<a-h>"] = { sms.resize_left, "Resize split left" },
      ["<a-j>"] = { sms.resize_down, "Resize split down" },
      ["<a-k>"] = { sms.resize_up, "Resize split up" },
      ["<a-l>"] = { sms.resize_right, "Resize split right" },
      ["<a-=>"] = { "<c-w>=", "Eqully resize all splits" },
      -- Navigate windows
      ["<c-h>"] = { sms.move_cursor_left, "Navigate to split left" },
      ["<c-j>"] = { sms.move_cursor_down, "Navigate to split down" },
      ["<c-k>"] = { sms.move_cursor_up, "Navigate to split up" },
      ["<c-l>"] = { sms.move_cursor_right, "Navigate to split right" },
      -- Modify window layout
      ["<a-H>"] = { "<c-w>H", "Move split left" },
      ["<a-J>"] = { "<c-w>J", "Move split down" },
      ["<a-K>"] = { "<c-w>K", "Move split up" },
      ["<a-L>"] = { "<c-w>L", "Move split right" },
      ["<a-c>"] = { "<cmd>close<cr>", "Close split window" },
    }
  end,
})
