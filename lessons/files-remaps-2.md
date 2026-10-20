---
path: "/files-remaps-2"
title: "Files and Navigations - Remaps part 2"
order: "14A"
section: "Navigation"
description: "Coconut oil in hand, you are ready to navigate some files with nvim-tree."
---

> Local edition for Billy’s NvChad keys. Read the repository README first;
> launch writable exercises with `./learn 0` through `./learn 6`.

## Read a mapping in Lua

Your existing file-tree mapping has this shape:

```lua
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", {
  desc = "Focus file explorer",
})
```

`n` means Normal mode. `<leader>` is Space in your setup. The left side is the
keys you press, and the right side is the action. `<CR>` means Enter.
`vim.keymap.set` is non-recursive by default.

Press **Space e** now: your real explorer opens or gains focus. The mapping is
already installed, so you do not need to paste the sample into another vimrc.
Use `:verbose nmap <leader>e` to inspect the active mapping.

## Reloading experiments versus your full editor

Use `./learn plugin` to open a local Lua experiment. For an actual Lua file,
`:luafile %` executes that file; it is not a command to run on this Markdown lesson.
For changes to installed options, mappings or plugin declarations, save and
restart Neovim to verify the complete startup. Reloading the entire init.lua
inside a running Lazy setup is not required by this course.

The upstream Space+Enter/init.vim reload mapping is replaced by that explicit
save/restart workflow. Space e remains your explorer key everywhere.
