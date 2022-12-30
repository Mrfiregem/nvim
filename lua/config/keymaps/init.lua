local wk = require("which-key")

local leader_keymaps = {
  s = {
    name = "Telescope",
    t = { "<cmd>Telescope<cr>", "Search Builtins" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    g = { "<cmd>Telescope live_grep<cr>", "Grep Files In PWD" },
  },
  cd = { function() vim.cmd.cd(vim.fn.expand("%:p:h")) end, "Set CWD to current file's parent" },
  t = {
    name = "LazyTerm",
    g = { "<cmd>Lazygit<cr>", "Open lazygit if in git repo" },
  },
  g = {
    name = "Gitsigns",
    u = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
    d = { "<cmd>Gitsigns diffthis<cr>", "Vimdiff current file" },
    b = { "<cmd>Gitsigns blame_line<cr>", "Git blame the current line" },
    h = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk at cursor" },
    l = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle inline git blame at eol" },
  },
}

local normal_keymaps = {
  ["<c-l>"] = "Clear Highlight",
  ["<c-c>"] = {
    function()
      if vim.api.nvim_buf_get_name(0) == "" then
        vim.cmd.quit()
      else
        vim.api.nvim_buf_delete(0, {})
      end
    end,
    "Delete buffer",
  },
  ["[g"] = { "<cmd>Gitsigns next_hunk<cr>", "Goto next hunk" },
  ["]g"] = { "<cmd>Gitsigns prev_hunk<cr>", "Goto previous hunk" },
}

wk.register(leader_keymaps, { prefix = "<leader>" })

-- File-related mappings
wk.register(normal_keymaps)

-- Window-related keymaps
-- : Only loaded when a new window is created
local augroup_id = vim.api.nvim_create_augroup("SmartSplits", {})
vim.api.nvim_create_autocmd("WinNew", {
  group = augroup_id,
  pattern = "*",
  callback = function()
    local sms = require("smart-splits")
    wk.register {
      -- Resize windows
      ["<c-h>"] = { sms.resize_left, "Resize split left" },
      ["<c-j>"] = { sms.resize_down, "Resize split down" },
      ["<c-k>"] = { sms.resize_up, "Resize split up" },
      ["<c-l>"] = { sms.resize_right, "Resize split right" },
      ["<c-=>"] = { "<c-w>=", "Eqully resize all splits" },
      -- Navigate windows
      ["<a-h>"] = { sms.move_cursor_left, "Navigate to split left" },
      ["<a-j>"] = { sms.move_cursor_down, "Navigate to split down" },
      ["<a-k>"] = { sms.move_cursor_up, "Navigate to split up" },
      ["<a-l>"] = { sms.move_cursor_right, "Navigate to split right" },
      -- Modify window layout
      ["<a-H>"] = { "<c-w>H", "Move split left" },
      ["<a-J>"] = { "<c-w>J", "Move split down" },
      ["<a-K>"] = { "<c-w>K", "Move split up" },
      ["<a-L>"] = { "<c-w>L", "Move split right" },
      ["<a-c>"] = { "<cmd>close<cr>", "Close split window" },
    }
  end,
})
