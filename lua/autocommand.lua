local aucmd = function(event, pattern, command, group)
  local opts = {
    pattern = pattern,
    command = command,
    group = group,
  }

  vim.api.nvim_create_autocmd(event, opts)
end

local augroup = function(name)
  vim.api.nvim_create_augroup(name, { clear = true })
end

aucmd("FileType", "text",   "setlocal tw=78, spell")
aucmd("BufRead",  "*.rdoc", "setlocal tw=78 spell")

aucmd("BufRead", { "*.rake", "*.rf", "*.ffi", }, "setlocal filetype=ruby")

aucmd("FileType", "c",          "setlocal tw=78 ts=8 sts=4 sw=4 noet")
aucmd("FileType", "cpp",        "setlocal tw=78 ts=8 sts=4 sw=4 noet")
aucmd("FileType", "css",        "setlocal tw=78 ts=2 sts=2 sw=2 et nosi")
aucmd("FileType", "dot",        "setlocal tw=78 ts=4 sts=4 sw=4 et")
aucmd("FileType", "eruby",      "setlocal ts=2 sts=2 sw=2 et nosi noai nofen")
aucmd("FileType", "groovy",     "setlocal tw=78 ts=2 sts=2 sw=2 et")
aucmd("FileType", "javascript", "setlocal tw=78 ts=2 sts=2 sw=2 et")
aucmd("FileType", "json",       "setlocal tw=78 ts=2 sts=2 sw=2 et")
aucmd("FileType", "lua",        "setlocal tw=78 ts=2 sts=2 sw=2 et nosi")
aucmd("FileType", "nu",         "setlocal tw=78 ts=2 sts=2 sw=2 et nosi")
aucmd("FileType", "objc",       "setlocal tw=78 ts=4 sts=4 sw=4 et")
aucmd("FileType", "perl",       "setlocal tw=78 ts=4 sts=4 sw=4 et")
aucmd("FileType", "python",     "setlocal tw=78 ts=4 sts=4 sw=4 et")
aucmd("FileType", "ruby",       "setlocal tw=78 ts=2 sts=2 sw=2 et nosi")
aucmd("FileType", "sh",         "setlocal tw=78 ts=4 sts=4 sw=4 et nosi")
aucmd("FileType", "sshconfig",  "setlocal tw=78 ts=4 sts=4 sw=4 et nospell")
aucmd("FileType", "vim",        "setlocal tw=78 ts=2 sts=2 sw=2 et nosi")
aucmd("FileType", "xml",        "setlocal tw=78 ts=2 sts=2 sw=2 et nosi")
aucmd("FileType", "yaml",       "setlocal ts=2 sts=2 sw=2 et nosi noai nofen")
aucmd("FileType", "zsh",        "setlocal tw=78 ts=2 sts=2 sw=2 et nosi")

-- Check if files were modified outside nvim
aucmd("FocusGained", "*", ":checktime")
aucmd("BufEnter",    "*", ":checktime")

-- Disable numberline
aucmd("TermOpen", "*", "setlocal nonumber norelativenumber")

local cprog = augroup("cprog")
aucmd("FileType", "*", "setlocal formatoptions=tcql nocindent comments&", cprog)
aucmd("FileType", { "c", "cpp" }, "setlocal formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://", cprog)

-- When editing a file, always jump to the last known cursor position.
-- Don't do it when the position is invalid or when inside an event handler
-- (happens when dropping a file on gvim).
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function(args)
    local last_line = vim.api.nvim_buf_get_mark(args.buf, "\"")[1]
    local max_line = vim.api.nvim_buf_line_count(args.buf)

    if last_line and last_line <= max_line then
      vim.api.nvim_exec([[normal g`"]], true)
    end
  end,
  desc = "Jump to last known cursor position",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function(args)
    vim.api.nvim_del_autocmd(args.id)
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "COMMIT_EDITMSG",
      command = "call setpos('.', [0, 1, 1, 0])"
    })
  end,
  desc = "Jump to top of git commit message"
})
