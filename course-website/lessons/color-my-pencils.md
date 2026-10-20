---
path: "/color-my-pencils"
title: "Color My Pencils"
order: "10A"
description: "Lets set some colorschemes"
section: "The VimRC"
---

> Local edition for Billy’s NvChad keys. Read the repository README first;
> launch writable exercises with `./learn 0` through `./learn 6`.

> [!NOTE]
> **CHANGED FOR YOUR SETUP.**
>
> The original chose a colorscheme with :colorscheme and saved it in a vimrc.
> Your theme selection uses NvChad/base46 and lua/chadrc.lua. Space t h is
> already bound; no extra mapping is needed.

Your theme is Catppuccin through NvChad/base46. Press **Space t h** to open
NvChad's theme picker, use its displayed selection controls, and press Enter to
choose a theme. The current theme preference lives in `lua/chadrc.lua` under
your Neovim configuration directory.

For help, use `:help colorscheme` or `:help options`. In a colon command,
Ctrl+d lists available completions and Tab cycles them. Ctrl+p/Ctrl+n are
completion navigation keys there; Normal-mode file finding uses Space f f.

You can change many options for one buffer with `:setlocal`. These experiments
are temporary unless saved in the relevant Lua config module. Keep your known
working options and plugin declarations while learning one change at a time.
