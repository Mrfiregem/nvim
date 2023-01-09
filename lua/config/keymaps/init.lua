local wk = require("which-key")

local leader_keymaps = {
  [" "] = { vim.cmd.nohlsearch, "Clear highlight from previous search" },
  c = { function() vim.cmd.cd(vim.fn.expand("%:p:h")) end, "Set CWD to current file's parent" },
  g = {
    name = "Gitsigns",
    u = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
    d = { "<cmd>Gitsigns diffthis<cr>", "Vimdiff current file" },
    b = { "<cmd>Gitsigns blame_line<cr>", "Git blame the current line" },
    h = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk at cursor" },
    l = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle inline git blame at eol" },
  },
  q = { function() require("utils.functions").help_split() end, "Show help page for current word" },
  s = {
    name = "Telescope",
    t = { "<cmd>Telescope<cr>", "Search Builtins" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    g = { "<cmd>Telescope live_grep<cr>", "Grep Files In PWD" },
  },
  t = {
    name = "LazyTerm",
    g = { "<cmd>Lazygit<cr>", "Open lazygit if in git repo" },
  },
  w = {
    function() vim.api.nvim_set_current_win(require("window-picker").pick_window() or vim.api.nvim_get_current_win()) end,
    "Focus selected window",
  },
  x = {
    name = "Neo-Tree",
    F = { "<cmd>Neotree reveal<cr>", "Show current file in Neo-tree" },
    f = { "<cmd>Neotree toggle reveal<cr>", "Toggle showing current file in Neo-tree" },
    g = { "<cmd>Neotree git_status<cr>", "Show modified git files in CWD" },
    O = { "<cmd>Neotree<cr>", "Open Neo-tree" },
    o = { "<cmd>Neotree toggle<cr>", "Toggle opening Neo-tree" },
    x = { "<cmd>Neotree close<cr>", "Close Neo-tree" },
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
  ["]g"] = { "<cmd>Gitsigns next_hunk<cr>", "Goto next hunk" },
  ["[g"] = { "<cmd>Gitsigns prev_hunk<cr>", "Goto previous hunk" },
  ["]q"] = { "<cmd>cnext<cr>", "Goto next quickfix item" },
  ["[q"] = { "<cmd>cprev<cr>", "Goto previous quickfix item" },
  ["]b"] = { "<cmd>bnext<cr>", "Goto next buffer" },
  ["[b"] = { "<cmd>bprev<cr>", "Goto previous buffer" },
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
