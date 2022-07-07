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
-- Show signature help
remap("n", "<C-k>",     vim.lsp.buf.signature_help,         bufopts)
-- Jump to type definition (I don't use tabs)
remap("n", "1gD",       vim.lsp.buf.type_definition,        bufopts)
remap("n", "<space>D",  vim.lsp.buf.type_definition,        bufopts)
remap("n", "gt",        vim.lsp.buf.type_definition,        bufopts)
-- Apply code action
remap("n", "<space>ca", vim.lsp.buf.code_action,            bufopts)
-- Format buffer
remap("n", "<space>f",  vim.lsp.buf.formatting,             bufopts)
-- Rename symbol
remap("n", "<space>rn", vim.lsp.buf.rename,                 bufopts)
-- Add to workspace folder
remap("n", "<space>wa", vim.lsp.buf.add_workspace_folder,   bufopts)
-- Show workspace folders
remap("n", "<space>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, bufopts)
-- Remove workspace folder
remap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
-- Show hover
remap("n", "K",         vim.lsp.buf.hover,                   bufopts)
-- List buffer symbols in quickfix
remap("n", "g0",        vim.lsp.buf.document_symbol,         bufopts)
remap("n", "gD",        vim.lsp.buf.declaration,             bufopts)
-- List workspace symbols in quickfix
remap("n", "gW",        vim.lsp.buf.workspace_symbol,        bufopts)
-- Jump to definition
remap("n", "gd",        vim.lsp.buf.definition,              bufopts)
-- Jump to implementation
remap("n", "gi",        vim.lsp.buf.implementation,          bufopts)
-- List references in quickfix
remap("n", "gr",        vim.lsp.buf.references,              bufopts)

-- Lspsaga
--
-- code action
local action = require("lspsaga.codeaction")
remap("n", "<leader>ca", action.code_action, silent)
remap("v", "<leader>ca", function()
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
    action.range_code_action()
end, silent)
-- rename
remap("n", "<leader>lr", require("lspsaga.rename").lsp_rename, silent)


-- Telescope
-- https://github.com/nvim-telescope/telescope.nvim#pickers
remap("n", "<leader>fb", require('telescope.builtin').buffers, nil)
remap("n", "<leader>ff", require('telescope.builtin').find_files, nil)
remap("n", "<leader>fg", require('telescope.builtin').live_grep, nil)
remap("n", "<leader>fh", require('telescope.builtin').help_tags, nil)
remap("n", "<leader>fi", require('telescope.builtin').lsp_incoming_calls, nil)
remap("n", "<leader>fo", require('telescope.builtin').lsp_outgoing_calls, nil)
