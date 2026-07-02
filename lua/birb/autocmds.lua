local M = {}

local function start(ev)
  pcall(vim.treesitter.start, ev.buf)
end

---Register autocommands.
function M.setup()
  local group = vim.api.nvim_create_augroup("Treesitter", { clear = true })

  vim.api.nvim_create_autocmd("FileType", { callback = start, desc = "Start treesitter", group = group })
end

return M
