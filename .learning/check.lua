-- Run with the regular installed configuration: nvim --headless -i NONE -n -c 'luafile .learning/check.lua'
local root = vim.fs.dirname(vim.fs.dirname(vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p")))
local passed = {}
local probe = root .. "/.practice/runtime-probe.md"

local function pass(name)
  table.insert(passed, name)
  print("PASS: " .. name)
end

local function keys(sequence)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(sequence, true, false, true), "xt", false)
  vim.wait(40, function()
    return false
  end)
end

local function fixture(lines)
  vim.cmd.enew { bang = true }
  vim.bo.swapfile = false
  vim.bo.undofile = false
  vim.bo.readonly = false
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.api.nvim_win_set_cursor(0, { 1, 0 })
end

local function text()
  return table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
end

local function run()
  vim.o.lines = 48
  vim.o.columns = 140
  vim.o.clipboard = ""
  vim.o.shadafile = "NONE"
  vim.o.undofile = false
  vim.wait(150, function()
    return false
  end)
  assert(vim.fn.maparg(";", "n") == ":", "Semicolon command entry was lost")
  assert(vim.fn.maparg("<C-k>", "n"):find("TmuxNavigateUp", 1, true), "Pane navigation was replaced")

  fixture { "one two three", "second line", "third line" }
  keys "w"
  assert(vim.api.nvim_win_get_cursor(0)[2] == 4)
  keys "0dw"
  assert(text():find "^two three")
  keys "u"
  assert(text():find "^one two three")
  keys "<C-r>"
  assert(text():find "^two three")
  pass "Word motions, operators, undo and redo execute with installed mappings"

  fixture { "first", "second", "third" }
  keys "2dd"
  assert(text() == "third")
  keys "ihello jk"
  assert(vim.api.nvim_get_mode().mode == "n" and text() == "hello third")
  pass "Counts, insertion and jk leave Insert mode as taught"

  fixture { "a.b.c.d" }
  keys "f."
  assert(vim.api.nvim_win_get_cursor(0)[2] == 1)
  keys " ;"
  assert(vim.api.nvim_win_get_cursor(0)[2] == 3, "Space ; did not repeat character find")
  keys ","
  assert(vim.api.nvim_win_get_cursor(0)[2] == 1)
  pass "Space ; repeats character find and comma reverses it without changing semicolon command entry"

  fixture { "copy", "replace" }
  keys '"ayy'
  assert(vim.fn.getreg "a" == "copy\n")
  keys "jVp"
  assert(text() == "copy\ncopy" and vim.fn.getreg '"' == "copy\n", "Visual paste replaced the copied register")
  keys '"ap'
  assert(text() == "copy\ncopy\ncopy")
  pass "Named registers and Visual p use the documented preserved-copy behavior"

  fixture { "one", "two", "three" }
  keys "qa0xjq"
  keys "2@a"
  assert(text() == "ne\nwo\nhree", "Macro recording/replay changed: " .. vim.inspect { text(), vim.fn.getreg "a" })
  keys ":%s/e/E/g<CR>"
  assert(text() == "nE\nwo\nhrEE")
  pass "Macros and whole-buffer substitutions operate on real text"

  fixture { "one", "two", "three" }
  keys "qaA!<Esc>jq"
  assert(vim.fn.getreg "a" == "A!\27j", "Completion changed recorded Insert-mode keys")
  keys "2@a"
  assert(text() == "one!\ntwo!\nthree!", "Insert-mode macro did not replay correctly")
  local cmp = require "cmp"
  local prepare, initialized = cmp.core.prepare, 0
  cmp.core.prepare = function(self, ...)
    initialized = initialized + 1
    return prepare(self, ...)
  end
  -- Leave Insert mode only after cmp's deferred initialization can run.
  vim.defer_fn(function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "t", false)
  end, 150)
  vim.api.nvim_feedkeys("A ", "xt!", false)
  cmp.core.prepare = prepare
  assert(initialized > 0, "Normal Insert-mode completion initialization was disabled")
  pass "Insert-mode macros retain their typed keys and replay with completion installed"

  fixture { "if (true) {", "  inside", "}" }
  keys "f{"
  keys "%"
  assert(vim.api.nvim_win_get_cursor(0)[1] == 3)
  keys "kdi{"
  assert(not text():find("inside", 1, true), "Inside-brace text object failed")
  pass "Matching delimiters and inside-brace text objects work with the installed mini tools"

  local nav = root .. "/.practice/navigation"
  vim.cmd.cd(vim.fn.fnameescape(nav))
  vim.cmd.edit { args = { "src/sockets.c" }, bang = true }
  keys "mA"
  vim.cmd.edit "src/twitch.c"
  keys "'A"
  assert(vim.api.nvim_buf_get_name(0) == nav .. "/src/sockets.c")
  pass "Uppercase marks jump between actual course fixture files"

  vim.cmd "vimgrep /SOCKET_OPEN/gj src/*.c"
  assert(#vim.fn.getqflist() >= 2, "Course quickfix search has too few results")
  vim.cmd.cfirst()
  keys "]q"
  assert(vim.fn.getqflist({ idx = 0 }).idx == 2)
  keys "[q"
  assert(vim.fn.getqflist({ idx = 0 }).idx == 1)
  keys " qo"
  assert(vim.bo.buftype == "quickfix")
  keys "<C-k>"
  assert(vim.bo.buftype ~= "quickfix" and vim.fn.getqflist({ idx = 0 }).idx == 1)
  keys " qc"
  assert(vim.fn.getqflist({ winid = 0 }).winid == 0)
  pass "Real quickfix results open, navigate and close while Ctrl+k keeps window navigation"

  keys " e"
  assert(vim.bo.filetype == "NvimTree", "Space e did not focus the explorer")
  local tree = require "nvim-tree.api"
  tree.tree.find_file { buf = nav .. "/src/sockets.c", open = true, focus = true }
  keys "<CR>"
  assert(vim.api.nvim_buf_get_name(0) == nav .. "/src/sockets.c", "Explorer Enter did not open the selected file")
  keys "<C-n>"
  assert(not tree.tree.is_visible())
  pass "Space e, explorer Enter and Ctrl+n act on the actual nvim-tree"

  for _, spec in ipairs {
    { " ff", "find_files" },
    { " fg", "git_files" },
    { " fw", "live_grep" },
    { " fb", "buffers" },
  } do
    keys(spec[1])
    local state = require "telescope.actions.state"
    local buf = vim.api.nvim_get_current_buf()
    local picker = state.get_current_picker(buf)
    assert(picker and picker.prompt_bufnr == buf, "Picker failed: " .. spec[2])
    if spec[2] == "find_files" or spec[2] == "git_files" then
      assert(
        vim.wait(2500, function()
          return picker.manager and picker.manager:num_results() > 0
        end),
        "File picker has no results"
      )
    elseif spec[2] == "live_grep" then
      keys "SOCKET_OPEN"
      assert(
        vim.wait(2500, function()
          return picker.manager and picker.manager:num_results() >= 2
        end),
        "Live grep did not search course fixtures"
      )
    end
    require("telescope.actions").close(buf)
    keys "<Esc>"
  end
  pass "All four taught Telescope keys open real pickers, including file results and live grep matches"

  dofile(root .. "/.learning/compat.lua")
  vim.cmd.edit(vim.fn.fnameescape(root .. "/lessons/exercise-0-hjkl-x.md"))
  vim.wait(80, function()
    return false
  end)
  assert(vim.bo.readonly and vim.b.disable_autoformat)
  assert(not vim.wo.wrap and not vim.wo.spell and not vim.wo.foldenable and vim.wo.conceallevel == 0)
  local content = "# An ASCII exercise\n\n|     x      |   \n"
  local file = assert(io.open(probe, "wb"))
  file:write(content)
  file:close()
  vim.cmd.edit(vim.fn.fnameescape(probe))
  vim.wait(80, function()
    return false
  end)
  assert(not vim.bo.readonly and vim.b.disable_autoformat)
  keys "A <Esc>"
  keys "u"
  vim.cmd.write()
  file = assert(io.open(probe, "rb"))
  local saved = file:read "*a"
  file:close()
  assert(saved == content, "Saving reformatted an ASCII exercise")
  pass "Reference protection and practice presentation apply; a real save preserves ASCII whitespace"

  local plugin = root .. "/.practice/plugin-demo/plugin/course_hello.lua"
  assert(vim.fn.filereadable(plugin) == 1, "Prepare the demo with ./learn plugin --print first")
  vim.cmd.luafile(vim.fn.fnameescape(plugin))
  local notify, received = vim.notify, nil
  vim.notify = function(message)
    received = message
  end
  vim.cmd.CourseHello()
  vim.notify = notify
  assert(received == "Hello from your practice plugin")
  pass "The Lua plugin lesson loads and runs the local CourseHello command"
end

local ok, err = xpcall(run, debug.traceback)
os.remove(probe)
if not ok then
  io.stderr:write(tostring(err) .. "\n")
  vim.cmd "cquit 1"
else
  vim.fn.writefile({ vim.json.encode { passed = passed, count = #passed } }, root .. "/.learning/results.json")
  print("All " .. #passed .. " learning runtime checks passed; no model requests")
  vim.cmd "qa!"
end
