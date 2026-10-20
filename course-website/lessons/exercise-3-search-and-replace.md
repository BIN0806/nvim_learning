---
path: "/exercise-3"
title: "Search and Replace"
order: "72A"
section: "Misc Content"
description: "Search and Replace!"
---

> Local edition for Billy’s NvChad keys. Read the repository README first;
> launch writable exercises with `./learn 0` through `./learn 6`.

### Basic Search
> [!NOTE]
> **CHANGED FOR YOUR SETUP.** The search/substitution commands are built-in. Your ignorecase/smartcase settings affect
> letter case, n/N additionally center the view, and Esc clears highlighting. No custom
> search binding is required.

search for `error` by typing `/error<CR>`

error

Lets type a command in.  :set hls ic
What just happened?
Re-search `error`

error

But you can do more! try searching `/err.*or<CR>`

errooentuhoneuhnoteuhnotehuor

* Notice that it matched a huge portion on top.  That is because regexs will
  match the most it can.

### Search and Replace
replace "foo" with "baz" by typing `:s/foo/baz<CR>`
foo bar baz

Try again but notice that it only replaces one foo at a time.
foo foo foo foo

replace "foo" with "baz" by typing `:s/foo/baz/g<CR>`
foo foo foo foo

replace "foo" with "baz" by typing `:s/foo/baz/gc<CR>`
foo foo foo foo


#### Ranged search & replace

```typescript
function foo() {
    const a = "foo";
    const b = [
        "foo",
        "foo",
        "foo",
        "foo",
    ];
    if ("foo") {
        return "foo";
    }
    return "baz";
}
```
#### Full File
> [!NOTE]
> **CHANGED FOR YOUR SETUP.** After quitting the practice buffer, reopen it from the course root with ./learn 3. Use
> ./learn reset 3 only if you want a fresh copy; reset first backs up saved progress.

Lets execute `:%s/foo/bar/gc`, but first exit without saving `:q!` and reopen
this file

#### But what about full project find and replace
I am going to leave this out of this course.
