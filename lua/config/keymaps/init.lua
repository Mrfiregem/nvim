local wk = require("which-key")
local tb = require("telescope.builtin")
local sms = require("smart-splits")

-- '<leader>' keybinds
wk.register({
  [" "] = { "<cmd>nohlsearch<cr>", "Clear Highlight" },
  t = {
    name = "Telescope",
    t = { "<cmd>Telescope<cr>", "Search Builtins" },
    f = { function() tb.find_files() end, "Find File" },
    r = { function() tb.oldfiles() end, "Open Recent File" },
    g = { function() tb.live_grep() end, "Grep Files In PWD" },
  },
}, { prefix = "<leader>" })

-- Window navigation
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
