local M = {}

---pcall: treesitter has no parser for every filetype; fail silently when absent.
local function start(ev)
  pcall(vim.treesitter.start, ev.buf)
end

function M.setup()
  local group = vim.api.nvim_create_augroup("Birb", { clear = true })

  vim.api.nvim_create_autocmd("FileType", {
    callback = start,
    desc = "Start treesitter",
    group = group,
  })
end

return M
