---
path: "/exercise-1"
title: "dyp"
order: "70A"
section: "Misc Content"
description: "This is the basic movement and editing of text"
---

> Local edition for Billy’s NvChad keys. Read the repository README first;
> launch writable exercises with `./learn 0` through `./learn 6`.

## NOTE
> [!NOTE]
> **CHANGED FOR YOUR SETUP.**
>
> The original download step is replaced by a writable local copy. Native dd,
> yy, p/P and selections remain available.

Run `./learn 1` from the course root to edit a writable copy. Your previous copy is preserved.

## Exercise 1: Basic Editing
### Delete a line with dd
delete me 1
delete me 2
delete me 3
delete me 4

### Yank and paste.  yy to yank line, p to paste line below, P above
yank me and paste below (yyp)
yank me and paste above (yyP)

### Visual Mode
#### Visual Mode
Highlight part of this line by pressing v, then navigate around
escape to leave visual mode

#### Visual Line Mode
Highlight this line by pressing V, then navigate around
escape to leave visual mode

> [!NOTE]
> **CHANGED FOR YOUR SETUP.**
>
> Your Visual-mode p preserves the copied register when replacing a selection.
> Once y has ended Visual mode, the following normal p behaves as the course
> expects. No extra mapping is needed.

#### Visual Mode + y / p
Highlight this line by pressing V, then press y  (What happened?)
press p (What happened?)

Highlight this point by pressing v, press wy  (What happened?)
press p (What happened?)

Lets repeat but with d instead of y, (What happened?)

## Part 3: The relationship of y / d
:h reg
:reg

What did we see there?

yank this line

What happened to the registers?
