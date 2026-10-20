---
path: "/your-first-plugin"
title: "First Plugin"
order: "60A"
section: "Your First Plugin"
description: "Time to learn viml."
---

> Local edition for Billy’s NvChad keys. Read the repository README first;
> launch writable exercises with `./learn 0` through `./learn 6`.

## Write a local Lua plugin experiment

> [!NOTE]
> **CHANGED FOR YOUR SETUP.** The original plugin walkthrough uses a manually added runtime path and a Vim-Plug
> development entry. This version provides an ignored local Lua experiment and an explicit
> :luafile % load. It adds no second plugin manager.

From the course root:

```sh
./learn plugin
```

This prepares `.practice/plugin-demo/plugin/course_hello.lua` only if it does
not exist, and opens your current copy. Its initial code is:

```lua
vim.api.nvim_create_user_command("CourseHello", function()
  vim.notify("Hello from your practice plugin")
end, { force = true })
```

> [!IMPORTANT]
> **BINDING NEEDED — ONLY FOR OPTIONAL SHORTCUTS.** :luafile % and :CourseHello work as commands. Neither has a dedicated Normal-mode
> shortcut in your reviewed profile. Optional Space l r and Space l h definitions follow,
> fully commented out; add only the ones you want. Save the experiment with :w before
> reloading; :CourseHello exists only after the demo is loaded.

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

```lua
-- OPTIONAL: Space l h runs the demo command after :luafile % registers it.
-- Location: lua/mappings.lua under :echo stdpath("config").
-- To enable, remove the leading "-- " from the mapping line, save and restart Neovim.
-- vim.keymap.set("n", "<leader>lh", "<cmd>CourseHello<CR>", { desc = "Run course hello" })
-- Outside the demo session, :CourseHello must be registered before this shortcut can run.
```

While editing that **Lua file**, run `:luafile %`, then run `:CourseHello`.
The notification confirms that your command registered. Edit the text, save
with `:w`, run `:luafile %` again, and try `:CourseHello` again. The `force`
option permits re-registering this one command during the experiment.

The experiment lives in the ignored practice area. It is not added to your
installed plugin list. `:help runtimepath` explains automatic plugin discovery;
a reusable local plugin can later be added with a Lazy `dir` specification.
This lesson needs neither Vim-Plug nor a second plugin manager.

Original course/plugin-writing inspiration remains credited to ThePrimeagen and
[Writing Vim Plugin by Łukasz Jan Niemier](https://vimways.org/2019/writing-vim-plugin/).
