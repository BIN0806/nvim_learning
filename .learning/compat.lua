-- Explicitly loaded by ./learn, alongside the normal installed Neovim config.
local root = vim.fs.dirname(vim.fs.dirname(vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p")))
local group = vim.api.nvim_create_augroup("VimFundamentalsPractice", { clear = true })

local function prepare(buf)
  if not vim.api.nvim_buf_is_valid(buf) then
    return
  end
  local path = vim.api.nvim_buf_get_name(buf)
  if path:sub(1, #root + 1) ~= root .. "/" or vim.bo[buf].buftype ~= "" then
    return
  end
  -- Saving an ASCII exercise must not run Prettier or a language formatter.
  vim.b[buf].disable_autoformat = true
  local lessons = root .. "/lessons/"
  local mirror = root .. "/course-website/lessons/"
  if path:sub(1, #lessons) == lessons or path:sub(1, #mirror) == mirror then
    vim.bo[buf].readonly = true
  end
  for _, win in ipairs(vim.fn.win_findbuf(buf)) do
    vim.wo[win].wrap = false
    vim.wo[win].spell = false
    vim.wo[win].foldenable = false
    vim.wo[win].conceallevel = 0
  end
end

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWinEnter", "FileType" }, {
  group = group,
  desc = "Keep course diagrams literal and practice saves unformatted",
  callback = function(event)
    vim.schedule(function()
      prepare(event.buf)
    end)
  end,
})
vim.schedule(function()
  prepare(vim.api.nvim_get_current_buf())
end)
