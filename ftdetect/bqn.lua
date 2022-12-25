vim.filetype.add {
  extension = { bqn = "bqn" },
  pattern = {
    [".*"] = {
      function(_, bufnr)
        local shebang = vim.filetype.getlines(bufnr, 1)
        if vim.filetype.matchregex(shebang, [[^#!.*bqn$]]) then return "bqn" end
      end,
    },
  },
}
