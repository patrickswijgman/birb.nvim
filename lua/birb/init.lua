local autocmds = require("birb.autocmds")
local config = require("birb.config")
local options = require("birb.options")

local M = {}

---@param user_opts? birb.Config
function M.setup(user_opts)
  config.setup(user_opts)
  options.setup()
  autocmds.setup()
end

return M
