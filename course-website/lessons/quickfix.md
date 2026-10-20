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

Run `./learn nav` from the course root. Then, in Neovim:

```vim
:vimgrep /SOCKET_OPEN/gj src/*.c
:copen
```

This searches the provided C fixtures and fills the quickfix list. It does not
rely on your shell's glob/grep syntax. There must be matching results before
next/previous-result navigation can do useful work.

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
