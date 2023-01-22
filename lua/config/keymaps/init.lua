local wk = require("which-key")

local leader_keymaps = {
  [" "] = { vim.cmd.nohlsearch, "Clear highlight from previous search" },
  c = { function() vim.cmd.cd(vim.fn.expand("%:p:h")) end, "Set CWD to current file's parent" },
  g = {
    name = "Gitsigns",
    u = { "<Cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
    d = { "<Cmd>Gitsigns diffthis<cr>", "Vimdiff current file" },
    b = { "<Cmd>Gitsigns blame_line<cr>", "Git blame the current line" },
    h = { "<Cmd>Gitsigns preview_hunk<cr>", "Preview hunk at cursor" },
    l = { "<Cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle inline git blame at eol" },
  },
  q = { function() require("utils.functions").help_split() end, "Show help page for current word" },
  s = {
    name = "Telescope",
    t = { "<Cmd>Telescope<cr>", "Search Builtins" },
    f = { "<Cmd>Telescope find_files<cr>", "Find File" },
    r = { "<Cmd>Telescope oldfiles<cr>", "Open Recent File" },
    g = { "<Cmd>Telescope live_grep<cr>", "Grep Files In PWD" },
  },
  t = {
    name = "LazyTerm",
    g = { "<Cmd>Lazygit<cr>", "Open lazygit if in git repo" },
  },
  w = {
    function() vim.api.nvim_set_current_win(require("window-picker").pick_window() or vim.api.nvim_get_current_win()) end,
    "Focus selected window",
  },
  x = {
    name = "Neo-Tree",
    C = { "<Cmd>Neotree current<cr>", "Replace buffer with Neo-tree" },
    c = { "<Cmd>Neotree toggle current<cr>", "Toggle replacing buffer with Neo-tree" },
    F = { "<Cmd>Neotree reveal<cr>", "Show current file in Neo-tree" },
    f = { "<Cmd>Neotree toggle reveal<cr>", "Toggle showing current file in Neo-tree" },
    g = { "<Cmd>Neotree git_status<cr>", "Show modified git files in CWD" },
    O = { "<Cmd>Neotree<cr>", "Open Neo-tree" },
    o = { "<Cmd>Neotree toggle<cr>", "Toggle opening Neo-tree" },
    x = { "<Cmd>Neotree close<cr>", "Close Neo-tree" },
  },
}

local normal_keymaps = {
  ["<C-l>"] = "Clear Highlight",
  ["<C-c>"] = {
    function()
      if vim.api.nvim_buf_get_name(0) == "" then
        vim.cmd.quit()
      else
        vim.api.nvim_buf_delete(0, {})
      end
    end,
    "Delete buffer",
  },
  ["]g"] = { "<Cmd>Gitsigns next_hunk<cr>", "Goto next hunk" },
  ["[g"] = { "<Cmd>Gitsigns prev_hunk<cr>", "Goto previous hunk" },
  ["]q"] = { "<Cmd>cnext<cr>", "Goto next quickfix item" },
  ["[q"] = { "<Cmd>cprev<cr>", "Goto previous quickfix item" },
  ["]b"] = { "<Cmd>bnext<cr>", "Goto next buffer" },
  ["[b"] = { "<Cmd>bprev<cr>", "Goto previous buffer" },
}

wk.register(leader_keymaps, { prefix = "<Leader>" })

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
      ["<M-h>"] = { sms.resize_left, "Resize split left" },
      ["<M-j>"] = { sms.resize_down, "Resize split down" },
      ["<M-k>"] = { sms.resize_up, "Resize split up" },
      ["<M-l>"] = { sms.resize_right, "Resize split right" },
      ["<M-=>"] = { "<c-w>=", "Eqully resize all splits" },
      -- Navigate windows
      ["<C-h>"] = { sms.move_cursor_left, "Navigate to split left" },
      ["<C-j>"] = { sms.move_cursor_down, "Navigate to split down" },
      ["<C-k>"] = { sms.move_cursor_up, "Navigate to split up" },
      ["<C-l>"] = { sms.move_cursor_right, "Navigate to split right" },
      -- Modify window layout
      ["<M-H>"] = { "<C-w>H", "Move split left" },
      ["<M-J>"] = { "<C-w>J", "Move split down" },
      ["<M-K>"] = { "<C-w>K", "Move split up" },
      ["<M-L>"] = { "<C-w>L", "Move split right" },
      ["<M-c>"] = { "<Cmd>close<cr>", "Close split window" },
    }
  end,
})
