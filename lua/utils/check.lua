local M = {}

---Determine if the current file is in a git repository
---@return boolean
function M.in_git_repo()
  local cfile = vim.fn.shellescape(vim.fn.expand("%:p:h"))
  local git_cmd = string.format("git -C %s rev-parse --git-dir &>/dev/null", cfile)
  vim.fn.system(git_cmd)
  return vim.v.shell_error == 0
end

---Determine if cwd is inside nvim's config folder
---@param file? string Check file instead of cwd
---@return boolean
function M.in_config_dir(file)
  if file ~= nil then
    file = vim.loop.fs_realpath(file)
  else
    file = vim.loop.cwd() or ""
  end
  return file:match("^" .. vim.fn.stdpath("config")) and true or false
end

return M
