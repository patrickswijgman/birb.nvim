local config = require("birb.config")

local M = {}

function M.setup()
  if config.opts.use_folds then
    vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.o.foldmethod = "expr"
  end

  if config.opts.auto_open_folds then
    vim.o.foldlevelstart = 99
  end

  if config.opts.path then
    vim.opt.runtimepath:append(config.opts.path)
  end
end

return M
