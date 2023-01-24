local function remap(mode, lhs, rhs, opts)
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
-- List workspace symbols in quickfix
remap("n", "gW",        lsp.workspace_symbol,        bufopts)

-- outline
remap("n","<leader>o", "<cmd>LSoutlineToggle<CR>", silent)
