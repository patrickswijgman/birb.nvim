local autocmds = require("birb.autocmds")
local config = require("birb.config")
local options = require("birb.options")

local M = {}

---Initialize plugin.
---
---@param user_opts? Opts user options
function M.setup(user_opts)
  config.setup(user_opts)
  options.setup()
  autocmds.setup()
end

return M
