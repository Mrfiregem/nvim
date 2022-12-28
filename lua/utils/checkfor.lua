local M = {}

M.in_git_repo = function()
  vim.fn.system(string.format("git -C %s rev-parse --git-dir &>/dev/null", vim.fn.shellescape(vim.fn.expand("%:h"))))
  return vim.v.shell_error == 0
end

return M
