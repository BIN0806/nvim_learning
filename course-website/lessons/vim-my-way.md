---
path: "/vim-my-way"
title: "Vim My Way"
order: "9A"
description: "Ok, so vim looked pretty ugly.  Lets make it feel the way we want it!"
section: "The VimRC"
---

> Local edition for Billy’s NvChad keys. Read the repository README first;
> launch writable exercises with `./learn 0` through `./learn 6`.

## Configure Vim behavior using your actual Neovim setup

> [!NOTE]
> **CHANGED FOR YOUR SETUP.**
>
> The original customized a vimrc. Your persistent options belong in
> lua/options.lua, and these setlocal experiments only affect this buffer. No
> new key mapping is needed.

Try these temporary commands in an exercise buffer:

```vim
:setlocal scrolloff=8
:setlocal number
:setlocal relativenumber
:setlocal norelativenumber
```

> [!NOTE]
> **CHANGED FOR YOUR SETUP.**
>
> Ctrl+d/u and n/N keep their native scrolling/search actions and additionally
> center your view in this profile.

Relative numbers help with commands such as `10j`, `5k` and `v10j`. `V` selects
whole lines; Esc returns to Normal mode. Your scrolling/search mappings already
keep the view centered with Ctrl+d, Ctrl+u, n and N.

> [!NOTE]
> **CHANGED FOR YOUR SETUP.**
>
> The JavaScript sample now opens as a writable local copy with ./learn js,
> leaving the reference intact.

For the JavaScript example, open it with:

```sh
./learn js
```

This is a writable practice copy; the reference sample stays intact. Your persistent options already live in `lua/options.lua`
under `:echo stdpath("config")`; C/C++ indentation is additionally set by its
filetype rule. Lua options look like `vim.opt.scrolloff = 8`. Inspect the existing
file instead of creating a second .vimrc or init.vim.

Help remains available with `:help options` and `:help scrolloff`. In the command
line, Ctrl+d lists completions; this differs from Normal-mode Ctrl+d scrolling.
