-- au BufRead,BufNewFile *.jq setfiletype jq
vim.filetype.add { extension = { jq = "jq" } }
