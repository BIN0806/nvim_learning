# vim — Billy’s Vim learning course

Local adaptation of [ThePrimeagen/vim-fundamentals](https://github.com/ThePrimeagen/vim-fundamentals)
at `aed0a14`, prepared October 20, 2026. Original author credit and licenses are
retained below. Adaptations map the lessons to your existing NvChad configuration.

## Start here

```sh
cd "/Users/billy/Documents/ChatGPT/HATE/vim learning/vim"
./learn
```

This opens this guide in your regular Neovim. Choose an exercise with `./learn 0`
through `./learn 6`; practice edits live under `.practice/`, separate from the
source lessons. Run `./learn lesson basic-usage` for a reading lesson, `./learn list`
for the lesson names, `./learn nav` for C file navigation, and `./learn plugin`
for a local Lua experiment. No website build or npm installation is required.
`./learn js` opens a writable copy of the JavaScript sample used in the settings
lesson. `./learn reset js` resets that copy with the same backup protection.

`./learn reset 0` makes a fresh exercise-0 copy and backs up the previous copy
under `.practice/backups/`. Opening an exercise normally keeps your progress.
`--print` prepares the copy and shows the command without launching Neovim.

The launcher keeps your normal editor configuration. Inside this repository it
turns off format-on-save, wrapping, spell display, concealment and folding so
ASCII diagrams and text exercises keep their shape. Reference lessons open
read-only; practice copies remain writable. Your configuration and unrelated
projects are unaffected by those process-local presentation adjustments.

## Reading the instruction comments

The notes are visible Markdown callouts, placed **before the affected
instruction**. They stay visible when reading the file directly in Neovim and
when viewing rendered Markdown. Labels occupy their own line and note prose
is wrapped for reading in an ordinary Neovim window.

| Label | What it means |
| --- | --- |
| **CHANGED FOR YOUR SETUP** | The note identifies the original behavior, your replacement and why it changed. |
| **ALREADY BOUND** | You can use the shown shortcut now. Commented definitions are recovery examples. |
| **BINDING NEEDED — ONLY FOR AN OPTIONAL SHORTCUT** | The colon command works already; the proposed shortcut is unassigned until you add the commented mapping. |
| **Built-in / unchanged** | Vim supplies the action directly; it does not need a custom key mapping. |

There are no known missing required course shortcuts in the reviewed full
profile. The optional examples are **Space l r** for reloading a saved Lua
experiment and **Space l h** for the demo’s CourseHello command. Neither optional
mapping is installed automatically. Both are explained immediately before their
instructions in [Remaps part 2](lessons/files-remaps-2.md) and
[First Plugin](lessons/first-plugin.md).

To use a commented binding recipe, find your actual configuration with
`:echo stdpath("config")`, open its `lua/mappings.lua`, and append the selected
recipe there. Remove `-- ` only from the mapping lines, leaving explanatory
comments commented out. Save and restart Neovim, then use `:verbose nmap <Space>lr`
or `:verbose nmap <Space>lh` to inspect the result. In a different profile, check
those keys first and choose an unused sequence if they are already assigned.
Do not paste a mapping into a Markdown lesson. Ordinary commands such as :w,
:edit, :reg and :help do not require custom bindings.

Existing practice copies keep your edits. Notes were merged into the existing
exercise-0 copy with a backup under `.practice/backups/`; no exercise was reset.
If a future copy has older instructions, read its current source with
`./learn lesson exercise-0-hjkl-x`, substituting the lesson name you need.

## A practical learning path

Read a lesson, quit back to your shell, then launch its exercise. The `./learn`
commands run in the shell; colon commands and editing keys run inside Neovim.
You can also keep a reading window beside a separate practice window.

| Exercise | Practice | What you gain |
| --- | --- | --- |
| 0 | h/j/k/l, w/b, x | Move precisely and remove a character. |
| 1 | dd, yy, p/P, v/V, y/d | Delete, copy, paste and select text. |
| 2 | i/a, I/A, o/O, Esc | Start typing at the right place with fewer movements. |
| 3 | /pattern, n/N, :s/old/new/g | Find text and replace it in a chosen range. |
| 4 | qa … q, @a, @@, 3@a | Record an edit, stop recording, replay it or repeat it three times. |
| 5 | :reg, "ayy, "ap | Inspect stored text and choose a named copy register. |
| 6 | f/t/F/T, Space ;, %, di{, counts | Combine operators with more precise movements and text objects. |

For a first macro, use three disposable lines. At the start of the first line,
type `qa0xjq`: `qa` records into register a, `0x` deletes its first character,
`j` moves down, and `q` stops. `2@a` applies the same edit to the next two lines.
Use u to undo, then practice on the supplied macro exercise. Registers holding
macros are also text registers, so avoid yanking into a while it holds that macro.

Save progress with `:w`, then quit with `:q`. Add one learned motion to real work
at a time; repeat an exercise when the movement stops feeling deliberate.

## Keys you will actually use

Press Esc before Normal-mode shortcuts. `<leader>` means Space; key sequences
are typed in order. `<C-k>` means hold Control and press k. Case matters.

| Action | Your keys / command |
| --- | --- |
| Move and edit text | Native h/j/k/l, w/b, dd, yy, p/P, i/a/o/O, u, Ctrl+r. |
| Leave Insert mode | Esc; your existing jk shortcut also works. |
| Open/focus explorer | Space e; Ctrl+n toggles it. |
| Find files / Git-tracked files | Space f f / Space f g. |
| Search project text | Space f w. |
| Next / previous quickfix result | ]q / [q, after populating a list. |
| Open / close quickfix | Space q o / Space q c. |
| Move between windows and tmux panes | Ctrl+h/j/k/l; Ctrl+w then h/j/k/l also works. |
| Find/till character again | Space ; repeats f/F/t/T; comma reverses. |
| Open command mode | Colon; your existing semicolon shortcut stays available. |
| Save / quit | :w / :q; :q! explicitly discards unsaved changes. |
| Inspect plugins / choose a theme | :Lazy / Space t h. |
| Open home dashboard | Space u d. |
| Execute a Lua experiment | :luafile % while an actual Lua file is current. |

The new Space ; and quickfix shortcuts are installed in your normal mappings,
so they also work outside the learning launcher. The built-in motions remain
available. Ctrl+d/u and n/N additionally center your viewport. Visual p preserves
your copied register; normal deletes and explicit registers retain their roles.
The course uses `nvim`, not the separate system `vim` executable.

## What changed from the original course

Each row links to instructions with a **CHANGED FOR YOUR SETUP** comment. These
are setup-specific substitutions; the original course history remains on master.

| Area | Original course | Your version and reason |
| --- | --- | --- |
| [Preparation](lessons/are-you-ready.md) | Clean Vim environment / config-stashing preparation. | Keep the installed NvChad profile so practice matches everyday editing. |
| [Exercise launch](lessons/basic-usage.md) | Vim plus downloads of upstream exercises. | ./learn makes writable local copies containing these annotations. |
| [Configuration](lessons/files-remaps-1.md) | vimrc/init.vim and Vimscript mappings. | Existing lua/mappings.lua, lua/options.lua and related modules. |
| [Theme](lessons/color-my-pencils.md) | :colorscheme and a vimrc preference. | Already-bound Space t h and NvChad/base46’s lua/chadrc.lua. |
| [Explorer](lessons/files-netrw.md) | NetRW, :Vex and Space p v. | Already-bound Space e / Ctrl+n and nvim-tree. |
| [File search](lessons/plugins.md) | Vim-Plug/FZF and a Ctrl+p example. | Existing Lazy/Telescope with Space f f/f g/f w/f b; no duplicate manager. |
| [Quickfix](lessons/quickfix.md) | Shell-dependent :grep; Ctrl+k/j/e quickfix mappings. | :vimgrep fixtures; ]q/[q and Space q o/q c preserve pane navigation and scrolling. |
| [Character-find repeat](lessons/exercise-6-motions.md) | Plain semicolon repeats f/F/t/T. | Space ; repeats; plain semicolon retains command entry. Already bound. |
| [Reloading](lessons/files-remaps-2.md) | Space+Enter sources init.vim. | Save/restart full config. :luafile % runs a saved Lua experiment; Space l r is an optional unbound shortcut. |
| [Visual paste](lessons/exercise-5-registers.md) | Default Visual paste register behavior. | Your Visual p preserves copied text for repeated replacements. Already configured. |
| [Viewport](lessons/exercise-3-search-and-replace.md) | Native scroll/search motions. | Same motions plus centering for Ctrl+d/u and n/N; smartcase/search-highlight preferences remain. |
| [Plugin experiment](lessons/first-plugin.md) | Runtime-path setup and a Vim-Plug development entry. | ./learn plugin plus :luafile % and :CourseHello. Space l h is an optional unbound shortcut. |
| [Macros](lessons/exercise-4-macros.md) | Native recording/replay. | Same keys, with the installed completion guard protecting recorded inserted text. |
| [Practice presentation](lessons/opening-vim.md) | Plain Vim exercise buffers. | Process-local literal display, no automatic formatting, read-only references and writable copies. |

Both lesson trees contain identical annotations. The comments show optional
binding recipes and recovery definitions without silently adding more shortcuts.

Navigation fixtures come from [ThePrimeagen/vim-nav-playground](https://github.com/ThePrimeagen/vim-nav-playground),
commit `7d58a0d`, cloned under `.practice/navigation`. It is an independent ignored
practice checkout. The original configuration-stashing scripts are not used.

A shortcut needs its normal context: quickfix navigation needs entries; Git-file
search needs a Git project; a character search needs that character on the line.
The runtime checks exercise those real contexts instead of only inspecting maps.

## Local history and verification

Your adapted course is on `codex/billy-keybindings`, with a local checkpoint tag
`course-2026-10-20-notes`. The earlier `course-2026-10-20-billy` tag preserves
this adaptation before inline annotations. `master` retains the original upstream snapshot.
The upstream remote remains ThePrimeagen’s repository; these adaptations are
saved locally. `.practice/` and its backups stay out of commits.

From this folder, run `python3 .learning/check.py` for lesson/launcher checks.
After `./learn plugin --print`, run
`nvim --headless -i NONE -n -c 'luafile .learning/check.lua'` for the 13 integration
checks against the installed full Neovim profile. The settings repository’s
README records the global mapping changes and settings restore tag separately.

## Lesson index

- [Introduction](lessons/intro.md)
- [The Terminology](lessons/terminology.md)
- [Are You Ready?](lessons/are-you-ready.md)
- [Opening Vim](lessons/opening-vim.md)
- [Using Vim](lessons/basic-usage.md)
- [Vim My Way](lessons/vim-my-way.md)
- [Color My Pencils](lessons/color-my-pencils.md)
- [Files and Navigations](lessons/files-intro.md)
- [Files and Navigations - nvim-tree](lessons/files-netrw.md)
- [Files and Navigations - Remaps part 1](lessons/files-remaps-1.md)
- [Files and Navigations - Remaps part 2](lessons/files-remaps-2.md)
- [Files and Navigations - Edit](lessons/files-e.md)
- [Files and Navigations - Marks](lessons/files-marks.md)
- [Files and Navigations - Recap](lessons/files-recap.md)
- [Pit Stop](lessons/mid-level-recap.md)
- [Plugins](lessons/plugins.md)
- [Quickfix Intro](lessons/quickfix.md)
- [Search And Replace](lessons/advanced-text-manipulation-1.md)
- [Macros](lessons/advanced-text-manipulation-2.md)
- [Registers](lessons/advanced-text-manipulation-3.md)
- [Pit Stop](lessons/adv-pitstop.md)
- [Advanced Motions](lessons/advanced-movements-1.md)
- [First Plugin](lessons/first-plugin.md)
- [hjkl-x](lessons/exercise-0-hjkl-x.md)
- [dyp](lessons/exercise-1-dyp.md)
- [insert](lessons/exercise-2-insert.md)
- [some javascript](lessons/some-javascript.md)
- [Search and Replace](lessons/exercise-3-search-and-replace.md)
- [Macros](lessons/exercise-4-macros.md)
- [Registers](lessons/exercise-5-registers.md)
- [Advanced Motions](lessons/exercise-6-motions.md)

## Original course attribution

<h1 align="center"><a href="https://frontendmasters.com/courses/vim-fundamentals/">VIM Fundamentals Course by ThePrimeagen</a></h1> <br>

<p align="center">
 As taught by ThePrimeagen for Frontend Masters
</p>

<p align="center">
  📝 <a href="https://theprimeagen.github.io/vim-fundamentals/">Course Website: VIM Fundamentals</a>
</p>

Fly through code faster than you thought possible using VIM! You’ll learn the basics of editing and even know how to exit VIM. Go deeper with navigation, macros, registers, find, and replaces. Then edit your vimrc plugins along with quickfix lists. Lastly, see ThePrimeagen demonstrate his ideal VIM workflow.

## License

The **code** is this repo is licensed under the Apache 2.0 license.

The **content** is this repo is licensed under the CC-BY-NC-4.0 license.
