---
path: "/files-netrw"
title: "Files and Navigations - nvim-tree"
order: "12A"
section: "Navigation"
description: "Coconut oil in hand, you are ready to navigate some files with nvim-tree."
---

> Local edition for Billy’s NvChad keys. Read the repository README first;
> launch writable exercises with `./learn 0` through `./learn 6`.

## Your explorer: nvim-tree

> [!NOTE]
> **CHANGED FOR YOUR SETUP.**
>
> The original NetRW :Vex / Space p v instructions are replaced by Space e for
> nvim-tree. Space e and Ctrl+n already exist in your profile; the explorer
> controls below are its real controls.

Start `./learn nav`, then press Esc followed by **Space e**. This opens or focuses
the file tree. Use `j`/`k` to select `src`, Enter to expand it, and Enter on
`twitch.c` to open it. Enter on an open directory collapses it.

Press **Space e** to return to the explorer. **Ctrl+n** toggles its visibility.
**Ctrl+h/j/k/l** moves between editor windows and tmux panes; `Ctrl+w` followed
by `h/j/k/l` also retains the built-in Neovim window navigation.

You can open files directly with `:edit src/sockets.c`. Your Normal-mode
**Space f f** opens the file picker and **Space f w** searches project text.

NetRW is disabled in this NvChad profile. The upstream `:Vex` action is replaced
here by Space e / nvim-tree; the rest of the course uses the same keys.
