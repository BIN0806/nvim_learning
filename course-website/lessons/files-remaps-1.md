---
path: "/files-remaps-1"
title: "Files and Navigations - Remaps part 1"
order: "13A"
section: "Navigation"
description: "Coconut oil in hand, you are ready to navigate some files with nvim-tree."
---

> Local edition for Billy’s NvChad keys. Read the repository README first;
> launch writable exercises with `./learn 0` through `./learn 6`.

## Find the configuration you actually use

Inside Neovim, run:

```vim
:echo stdpath("config")
:lua vim.cmd.edit(vim.fn.stdpath("config") .. "/lua/mappings.lua")
```

Your editor uses Lua modules rather than init.vim or ~/.vimrc:

| File under the config directory | Purpose |
| --- | --- |
| init.lua | Startup and plugin bootstrap. |
| lua/mappings.lua | Your custom keys. |
| lua/options.lua | Numbers, scrolling and editing preferences. |
| lua/chadrc.lua | Theme and dashboard preferences. |
| lua/plugins/init.lua | Lazy plugin declarations. |
| lua/configs/ | Individual plugin/language settings. |

Relative numbers and scrolloff are already configured. Read the files to see
how they work; this lesson does not require replacing them with an old sample
vimrc. Use `./learn plugin` for an editable Lua experiment kept in this repo.
