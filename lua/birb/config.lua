---@class Opts
---@field use_folds? boolean register treesitter as fold expression
---@field auto_open_folds? boolean open all folds automatically
---@field path? string path to treesitter parsers and queries

local M = {}

---@type Opts
local defaults = {
  use_folds = false,
  auto_open_folds = true,
  path = nil,
}

---Resolved options, populated by `setup()`.
---@type Opts
M.opts = defaults

---Merge user options over the defaults.
---
---@param user_opts? Opts
function M.setup(user_opts)
  M.opts = vim.tbl_deep_extend("force", {}, defaults, user_opts or {})
end

return M
