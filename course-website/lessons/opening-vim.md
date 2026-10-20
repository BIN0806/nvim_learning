---
path: "/opening-vim"
title: "Opening Vim"
order: "4A"
description: "Lets open vim for the first time!"
section: "Basics"
---

> Local edition for Billy’s NvChad keys. Read the repository README first;
> launch writable exercises with `./learn 0` through `./learn 6`.

## Open your first exercise

From the repository root, run:

```sh
./learn 0
```

This starts your installed Neovim with a writable copy of the local exercise.
It does not download an older unadapted version or replace your configuration.

Press Esc to enter Normal mode. Use `i` to type and Esc to stop typing. Your `jk`
Insert-mode shortcut also leaves Insert mode. `:w` saves; `:q` quits after saving;
`:q!` explicitly discards unsaved changes in the current buffer.

For a normal blank editor outside the course, use `nvim`; your NvChad dashboard
appears. `Space u d` opens that dashboard from an existing editing window.
