local wk = require("which-key")
local tb = require("telescope.builtin")

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
