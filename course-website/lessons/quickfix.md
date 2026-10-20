---
path: "/quickfix"
title: "Quickfix Intro"
order: "40A"
section: "Quickfix Lists"
description: "One of the last components of the vim experience."
---

> Local edition for Billy’s NvChad keys. Read the repository README first;
> launch writable exercises with `./learn 0` through `./learn 6`.

## Make a real quickfix list

> [!NOTE]
> **CHANGED FOR YOUR SETUP.**
>
> The original :grep command depended on shell glob and grep syntax. This
> fixture uses built-in :vimgrep against the provided C files. The colon
> command works without a key mapping.

Run `./learn nav` from the course root. Then, in Neovim:

```vim
:vimgrep /SOCKET_OPEN/gj src/*.c
:copen
```

This searches the provided C fixtures and fills the quickfix list. It does not
rely on your shell's glob/grep syntax. There must be matching results before
next/previous-result navigation can do useful work.

> [!NOTE]
> **CHANGED FOR YOUR SETUP — ALREADY BOUND.**
>
> The original Ctrl+k / Ctrl+j quickfix mappings conflict with your pane
> navigation, and Ctrl+e is kept for scrolling. Use ]q / [q and Space q o /
> Space q c instead. They are already installed; the comments show their
> definitions if a different profile needs them.

```lua
-- ALREADY BOUND in your full profile. These are recovery examples, not pending setup.
-- If missing in another profile: add to lua/mappings.lua, uncomment, save and restart.
-- vim.keymap.set("n", "]q", "<cmd>cnext<CR>", { desc = "Next quickfix result" })
-- vim.keymap.set("n", "[q", "<cmd>cprev<CR>", { desc = "Previous quickfix result" })
-- vim.keymap.set("n", "<leader>qo", "<cmd>copen<CR>", { desc = "Open quickfix list" })
-- vim.keymap.set("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Close quickfix list" })
```

| Keys / command | Action |
| --- | --- |
| Space q o / :copen | Open/focus the quickfix list. |
| ]q / :cnext | Jump to the next result. |
| [q / :cprev | Jump to the previous result. |
| Space q c / :cclose | Close the quickfix window. |
| Enter in the list | Open the selected result. |
| Ctrl+h/j/k/l | Move between editor windows and tmux panes. |
| Ctrl+w then h/j/k/l | Built-in window navigation also works. |

The upstream Ctrl+k/Ctrl+j quickfix mappings would replace your pane navigation,
so this edition teaches ]q/[q instead. Ctrl+e keeps its existing scrolling action.

Use `:help quickfix` to explore the list, its entries and commands. Re-run the
vimgrep command to rebuild the fixture list after experimenting.
