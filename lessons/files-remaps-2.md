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

> [!NOTE]
> **CHANGED FOR YOUR SETUP — ALREADY BOUND.**
>
> The original example bound Space p v to NetRW. Your explorer uses Space e
> and NvimTreeFocus, with Lua rather than Vimscript. This mapping is already
> installed; the commented recipe only shows how to restore it.

Your existing file-tree mapping has this shape:

```lua
-- ALREADY BOUND: Space e focuses nvim-tree; do not add a duplicate.
-- If it is missing in a different profile, put this in lua/mappings.lua.
-- Remove the leading "-- " from the mapping lines, save and restart Neovim.
-- vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", {

--   desc = "Focus file explorer",
-- })
```

`n` means Normal mode. `<leader>` is Space in your setup. The left side is the

keys you press, and the right side is the action. `<CR>` means Enter.

`vim.keymap.set` is non-recursive by default.

Press **Space e** now: your real explorer opens or gains focus. The mapping is
already installed, so you do not need to paste the sample into another vimrc.
Use `:verbose nmap <leader>e` to inspect the active mapping.

## Reloading experiments versus your full editor

> [!IMPORTANT]
> **BINDING NEEDED — ONLY FOR AN OPTIONAL SHORTCUT.**
>
> No Normal-mode shortcut is assigned to reloading a saved Lua experiment. The
> :luafile % command already works without a mapping. If you want Space l r
> for that action, use the commented recipe below. It replaces neither startup
> nor a full config restart.

```lua
-- OPTIONAL: Space l r reloads the saved Lua file you are editing.
-- Location: lua/mappings.lua under :echo stdpath("config").
-- To enable, remove the leading "-- " from the mapping lines below.
-- Save the Lua experiment with :w before using this shortcut; restart Neovim after binding it.
-- vim.keymap.set("n", "<leader>lr", function()

--   if vim.bo.filetype ~= "lua" or vim.api.nvim_buf_get_name(0) == "" then
--     return vim.notify("Open and save the Lua experiment first")
--   end
--   vim.cmd.luafile(vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)))
-- end, { desc = "Reload saved Lua experiment" })
```

Use `./learn plugin` to open a local Lua experiment. For an actual Lua file,
`:luafile %` executes that file; it is not a command to run on this Markdown lesson.
For changes to installed options, mappings or plugin declarations, save and
restart Neovim to verify the complete startup. Reloading the entire init.lua
inside a running Lazy setup is not required by this course.

> [!NOTE]
> **CHANGED FOR YOUR SETUP.**
>
> The original Space+Enter reload of init.vim is not installed. Your
> Lazy-managed configuration should be saved and restarted as a whole. The
> optional Space l r above executes only the current saved Lua experiment.

The upstream Space+Enter/init.vim reload mapping is replaced by that explicit
save/restart workflow. Space e remains your explorer key everywhere.
