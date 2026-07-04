# birb.nvim

A tiny plugin that wires up Neovim's built-in treesitter.

Named "birb" because birds sit in trees, they're literal treesitters!

## Features

- Start treesitter automatically for filetypes with a parser
- Automatically registers common parsers for filetypes that Neovim doesn't include by default (e.g. `tsx` parser for `typescriptreact` filetype)
- Use treesitter for folds

## Requirements

- Neovim 0.11+
- Either treesitter parsers and queries installed manually or via [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

## Install

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "patrickswijgman/birb.nvim",
  config = function()
    require("birb").setup()
  end,
}
```

With `vim.pack`:

```lua
vim.pack.add({
  "https://github.com/patrickswijgman/birb.nvim",
})

require("birb").setup()
```

## Configuration

`setup()` takes an optional table. These are the defaults:

```lua
require("birb").setup({
  use_folds = false,      -- use treesitter as the fold expression
  auto_open_folds = true, -- start with all folds open
  path = nil,             -- extra path to treesitter parsers/queries, added to runtimepath
})
```

If your treesitter parser (\*.so) and query (\*.scm) files live outside the plugin (e.g. on Nix), set `path` to the
directory containing them:

```lua
require("birb").setup({
  path = "/path/to/parsers_and_queries",
})
```
