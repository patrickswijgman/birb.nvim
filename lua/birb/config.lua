---@class Opts
---@field use_folds? boolean
---@field auto_open_folds? boolean
---@field path? string

local M = {}

---@type Opts
local defaults = {
  use_folds = false,
  auto_open_folds = true,
  path = nil,
}

---@type Opts
M.opts = defaults

---@param user_opts? Opts
function M.setup(user_opts)
  M.opts = vim.tbl_deep_extend("force", {}, defaults, user_opts or {})
end

return M
