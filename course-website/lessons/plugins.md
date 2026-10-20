---
path: "/plugins"
title: "Plugins"
order: "30A"
section: "Plugins"
description: "Lets beef up the RC!"
---

> Local edition for Billy’s NvChad keys. Read the repository README first;
> launch writable exercises with `./learn 0` through `./learn 6`.

## Your plugin manager is already installed

> [!NOTE]
> **CHANGED FOR YOUR SETUP.**
>
> The original installs Vim-Plug and FZF. Your profile already has Lazy and
> Telescope, so those installation steps were replaced rather than adding a
> second manager and finder.

Your setup uses **Lazy**. Run `:Lazy` to inspect the plugin list. Fuzzy finding
is supplied by **Telescope**, already installed; no Vim-Plug or FZF installation
is needed for this local course.

> [!NOTE]
> **CHANGED FOR YOUR SETUP — ALREADY BOUND.**
>
> The original Ctrl+p FZF example becomes Space f f with Telescope; the other
> finder rows below are existing mappings, not new bindings you must install.

Run `./learn nav`, then try:

| Keys / command | Actual action |
| --- | --- |
| Space f f | Find files under the current project directory. |
| Space f g | Find Git-tracked files; use it inside this Git project. |
| Space f w | Search project text. |
| Space f b | Switch open buffers. |
| :Lazy | Open the plugin manager. |

In a Telescope picker, type to filter, use Ctrl+n/Ctrl+p or the arrow keys, and
press Enter to open the selected result. Esc closes or leaves the picker mode.
Ctrl+p in Normal mode is not the file-search shortcut in your setup.

Plugin declarations live in `lua/plugins/init.lua` under your Neovim config.
Existing options live in `lua/configs/`. When deliberately adding a plugin,
append a compatible Lazy specification, restart Neovim, and use `:Lazy` to
inspect installation. The first-plugin lesson uses a local Lua experiment and
requires no package-manager change.
