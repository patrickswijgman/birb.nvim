-- Headless test runner.
--
-- Run from the repo root:
-- `nvim --headless --noplugin -u NONE --cmd "set rtp+=$PWD" -l tests/run.lua`

require("birb").setup()

-- Filetype mappings live in plugin/filetypes.lua, which --noplugin skips; source it.
vim.cmd("runtime plugin/filetypes.lua")

local failures = 0

local function check(name, ok)
  print((ok and "ok   - " or "FAIL - ") .. name)
  if not ok then
    failures = failures + 1
  end
end

-- plugin/filetypes.lua registers extra filetype->language mappings; spot-check a few.
check("registers ts -> typescript", vim.treesitter.language.get_lang("ts") == "typescript")
check("registers jsx -> javascript", vim.treesitter.language.get_lang("jsx") == "javascript")
check("registers svg -> xml", vim.treesitter.language.get_lang("svg") == "xml")

-- The FileType autocmd that starts treesitter must exist.
check("creates the Treesitter FileType autocmd", #vim.api.nvim_get_autocmds({ group = "Birb", event = "FileType" }) > 0)

print(("\n%d failed"):format(failures))
vim.cmd(failures == 0 and "qa!" or "cq!")
