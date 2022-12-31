local M = {}

---Automatically change root to directory containing 'root_files'
---
---root_files: List of file names indicating the root directory
---    eg: { 'Makefile', '.git' }
---@param cfg? {root_files: string[]}
function M.init_autoroot(cfg)
  if not cfg then cfg = { root_files = { ".git", "Makefile" } } end
  vim.g.autoroot_cache = {}

  local function set_root()
    local path = vim.api.nvim_buf_get_name(0)
    if path == "" then return end
    path = vim.fs.dirname(path)

    -- Check if path already cached
    local root = vim.g.autoroot_cache[path]
    if root == nil then
      local root_file = vim.fs.find(cfg.root_files, { path = path, upward = true })[1]
      if root_file == nil then return end
      root = vim.fs.dirname(root_file)
      vim.g.autoroot_cache[path] = root
    end

    -- set cwd
    vim.fn.chdir(root)
  end

  -- Create autocmd
  local autoroot_augroup = vim.api.nvim_create_augroup("AutoRoot", {})
  vim.api.nvim_create_autocmd("BufEnter", { group = autoroot_augroup, callback = set_root })
end

---Print an empty message without saving to message history
function M.clear_statusline_msg() vim.api.nvim_echo({ { "" } }, false, {}) end

---Run ':help' for the word under the cursor
---@param query? string
---@param cfg? {man_fts: string[]}
function M.help_split(query, cfg)
  query = query or vim.fn.expand("<cword>")
  cfg = cfg or {}
  cfg.man_fts = cfg.man_fts or { "sh", "fish" }

  local ft = vim.opt.filetype:get()

  if vim.tbl_contains(cfg.man_fts, ft) then
    vim.cmd.Man(query)
  else
    vim.cmd.help(query)
  end
end

return M
