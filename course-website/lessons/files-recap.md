---
path: "/files-recap"
title: "Files and Navigations - Recap"
order: "17A"
section: "Navigation"
description: "Coconut oil in hand, you are ready to navigate some files with e."
---

> Local edition for Billy’s NvChad keys. Read the repository README first;
> launch writable exercises with `./learn 0` through `./learn 6`.

## Navigation recap in your setup

- Space e opens/focuses nvim-tree; Ctrl+n toggles it.
- `:edit path/to/file` opens a file directly.
- Tab / Ctrl+d complete a colon command; Ctrl+p/Ctrl+n navigate completions.
- Space f f finds files; Space f g finds Git files; Space f w searches text.
- `mA` makes an uppercase file mark and `'A` jumps back to it.
- Ctrl+h/j/k/l moves through windows and tmux panes.
- ]q/[q jumps through quickfix entries; Space q o opens the list.
- `:echo expand("%")` prints the current file name; `"%p` pastes that register.
- Execute Lua experiments with `:luafile %`; restart after installed config changes.

Remember that key behavior depends on mode and context. Normal-mode shortcuts
are different from Insert-mode completion, Telescope or a terminal's input mode.
