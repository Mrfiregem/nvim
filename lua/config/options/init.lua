local o = vim.opt

-- Set keymaps
require("config.keymaps")

-- Set colorscheme
vim.cmd.colorscheme "catppuccin-macchiato"

-- Show line numbers
o.number = true
o.relativenumber = true

-- Use two spaces for indenting
o.expandtab = true
o.shiftwidth = 2

-- Case-insensitive search unless capital letters are used
o.ignorecase = true
o.smartcase = true

-- Open windows in more sensible locations
o.splitright = true
o.splitbelow = true

-- Set options for 'nvim-cmp' completion menu
o.completeopt = { "menu", "menuone", "noselect" }

-- Show whitespace characters
o.list = true
o.listchars = {
  tab = [[» ]],
  trail = [[·]],
  extends = [[›]],
  precedes = [[‹]],
  nbsp = [[~]],
}
