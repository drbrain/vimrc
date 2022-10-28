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
--remap("n", "<space>ca", lsp.code_action,            bufopts)
-- Format buffer
remap("n", "<space>f",  lsp.formatting,             bufopts)
-- Rename symbol
--remap("n", "<space>rn", lsp.rename,                 bufopts)
-- Add to workspace folder
remap("n", "<space>wa", lsp.add_workspace_folder,   bufopts)
-- Show workspace folders
remap("n", "<space>wl", function()
	print(vim.inspect(lsp.list_workspace_folders()))
end, bufopts)
-- Remove workspace folder
remap("n", "<space>wr", lsp.remove_workspace_folder, bufopts)
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

local keymap = vim.keymap.set
-- code action
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", silent)
keymap("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", silent)

keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", silent)

-- jump to diagnostic
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })

-- jump to error
keymap("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, silent)
keymap("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, silent)

-- hover
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", silent)

-- rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", silent)

-- outline
keymap("n","<leader>o", "<cmd>LSoutlineToggle<CR>", silent)
