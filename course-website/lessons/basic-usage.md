---
path: "/basic-usage"
title: "Using Vim"
order: "5A"
description: "Let's use vim for the first time!"
section: "Basics"
---

> Local edition for Billy’s NvChad keys. Read the repository README first;
> launch writable exercises with `./learn 0` through `./learn 6`.

Before we start editing files, lets get familiar with some basic movements.

From the course root, open your Insert-mode practice copy:

```bash
./learn 2
```

You are now in `NORMAL` mode.  This probably doesn't feel all that normal.
And you are right, its really not that normal.

## Lets talk Modes
There are a few modes that you should be aware of.

* Normal
* Insert
* Visual
* Visual Line

## My First If Statement
Lets write our first if statement.

Currently, you are in `NORMAL` mode.  This is where you can execute commands
to navigate, edit, and execute vim/sys commands.  To get out of this mode,
press `i`

After pressing `i`, your NvChad statusline indicates Insert mode. Automatic
pairs may add a closing bracket for you; type normally and observe the cursor.

Now that you are in insert mode, type the following

```js
if (true) {

}
```

Press `<esc>` or `<Ctrl-c>` (abbreviated `<C-c>`) to leave `INSERT` mode and back
to `NORMAL`.

Your existing Catppuccin/NvChad interface stays available throughout.

Type `:w` to save your practice copy, then `:q` to quit. `:q!` deliberately
discards unsaved changes; plain `:q` warns when you have edits to save.

## My First Moves
### Basic navigation

Open the local movement exercise:

```bash
./learn 0
```

### Deleting, Yanking, and Pasting
These are going to be some of your fundamental movements within vim.  This is
where you will see some significant speed ups compared to a conventional editor.


```bash
./learn 1
```

### Insert!
We are going to go over entering into insert mode

```bash
./learn 2
```

## Recap
Lets talk about what happened.  I would love to get some feedback from you.
What do you think about all of this nonsense?  Does it seem like to much?  Or
does it seem exciting?  I hope you are excited.

### We learned
* h,j,k,l for basic movement.
* w,b for word hopping.  Effectively the same as Option/Ctrl + arrow keys
* yy to "copy" a line, called Yank
* dd to delete, and yank, a line
* p and P to paste the contents of the implicit register below / above
* Most of the ways to go into insert mode!
  * i and a for which side of the cursor
  * I and A for which side of the line
  * o and O for belowe / above line
* zz - I snuck that one in...

That is a grand total of 16 different motions
