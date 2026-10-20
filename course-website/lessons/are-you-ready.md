---
path: "/are-you-ready"
title: "Are You Ready?"
order: "3A"
description: "The final hurrah! before diving into vim!"
section: "Introduction"
---

> Local edition for Billy’s NvChad keys. Read the repository README first;
> launch writable exercises with `./learn 0` through `./learn 6`.

This local edition follows ThePrimeagen's course using Billy's existing NvChad
configuration. The goal is to build muscle memory in the editor you actually use.

1. Run `./learn` from the repository root to read the local guide.
2. Run `./learn 0` to open a writable exercise copy.
3. Run `./learn nav` for the companion navigation project, already cloned into
   `.practice/navigation`.

Your Neovim configuration stays installed. You do not need to rename a vimrc,
remove plugins, or run the upstream environment-stashing script. The launcher
uses your regular Neovim and applies presentation/formatting adjustments only
inside this course repository. Source lessons open read-only; exercise copies
remain writable and are preserved between visits.

Practice a few motions at a time, then use them in real code. `./learn reset 0`
starts exercise 0 again and keeps the previous copy under `.practice/backups`.
