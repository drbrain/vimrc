function remap(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Diagnostics
local silent = { silent = true }
-- Show diagnostics
remap("n", "<space>e", vim.diagnostic.open_float, silent)
-- Next diagnostic
remap("n", "g[",       vim.diagnostic.goto_prev,  silent)
-- Previous diagnostic
remap("n", "g]",       vim.diagnostic.goto_next,  silent)
-- Add diagnostics to location list
remap("n", "<space>q", vim.diagnostic.setloclist, silent)

-- LSP
local bufopts = { silent=true, buffer=bufnr }
local lsp = vim.lsp.buf
-- Show signature help
remap("n", "<C-k>",     lsp.signature_help,         bufopts)
-- Jump to type definition (I don't use tabs)
remap("n", "1gD",       lsp.type_definition,        bufopts)
remap("n", "<space>D",  lsp.type_definition,        bufopts)
remap("n", "gt",        lsp.type_definition,        bufopts)
-- Apply code action
remap("n", "<space>ca", lsp.code_action,            bufopts)
-- Format buffer
remap("n", "<space>f",  lsp.formatting,             bufopts)
-- Rename symbol
remap("n", "<space>rn", lsp.rename,                 bufopts)
-- Add to workspace folder
remap("n", "<space>wa", lsp.add_workspace_folder,   bufopts)
-- Show workspace folders
remap("n", "<space>wl", function()
	print(vim.inspect(lsp.list_workspace_folders()))
end, bufopts)
-- Remove workspace folder
remap("n", "<space>wr", lsp.remove_workspace_folder, bufopts)
-- Show hover
remap("n", "K",         lsp.hover,                   bufopts)
-- List buffer symbols in quickfix
remap("n", "g0",        lsp.document_symbol,         bufopts)
remap("n", "gD",        lsp.declaration,             bufopts)
-- List workspace symbols in quickfix
remap("n", "gW",        lsp.workspace_symbol,        bufopts)
-- Jump to definition
remap("n", "gd",        lsp.definition,              bufopts)
-- Jump to implementation
remap("n", "gi",        lsp.implementation,          bufopts)
-- List references in quickfix
remap("n", "gr",        lsp.references,              bufopts)

local action = require("lspsaga.codeaction")
-- code action
remap("n", "<leader>ca", action.code_action, silent)
remap("v", "<leader>ca", function()
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
    action.range_code_action()
end, silent)
-- rename
remap("n", "<leader>lr", require("lspsaga.rename").lsp_rename, silent)


-- https://github.com/nvim-telescope/telescope.nvim#pickers
local telescope = require("telescope.builtin")
remap("n", "<leader>fb", telescope.buffers, nil)
remap("n", "<leader>ff", telescope.find_files, nil)
remap("n", "<leader>fg", telescope.live_grep, nil)
remap("n", "<leader>fh", telescope.help_tags, nil)
remap("n", "<leader>fi", telescope.lsp_incoming_calls, nil)
remap("n", "<leader>fo", telescope.lsp_outgoing_calls, nil)
remap("n", "<leader>fs", telescope.lsp_workspace_symbols, nil)
