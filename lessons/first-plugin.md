---
path: "/your-first-plugin"
title: "First Plugin"
order: "60A"
section: "Your First Plugin"
description: "Time to learn viml."
---

> Local edition for Billy’s NvChad keys. Read the repository README first;
> launch writable exercises with `./learn 0` through `./learn 6`.

## Write a local Lua plugin experiment

From the course root:

```sh
./learn plugin
```

This prepares `.practice/plugin-demo/plugin/course_hello.lua` only if it does
not exist, and opens your current copy. Its initial code is:

```lua
vim.api.nvim_create_user_command("CourseHello", function()
  vim.notify("Hello from your practice plugin")
end, { force = true })
```

While editing that **Lua file**, run `:luafile %`, then run `:CourseHello`.
The notification confirms that your command registered. Edit the text, save
with `:w`, run `:luafile %` again, and try `:CourseHello` again. The `force`
option permits re-registering this one command during the experiment.

The experiment lives in the ignored practice area. It is not added to your
installed plugin list. `:help runtimepath` explains automatic plugin discovery;
a reusable local plugin can later be added with a Lazy `dir` specification.
This lesson needs neither Vim-Plug nor a second plugin manager.

Original course/plugin-writing inspiration remains credited to ThePrimeagen and
[Writing Vim Plugin by Łukasz Jan Niemier](https://vimways.org/2019/writing-vim-plugin/).
