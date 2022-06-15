require("trouble").setup {
  height = 5,
  use_diagnostic_signs = true,
}

local km_opts = {silent = true, noremap = true}

vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", km_opts)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", km_opts)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", km_opts)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", km_opts)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", km_opts)
vim.api.nvim_set_keymap("n", "<leader>xL", "<cmd>Trouble lsp_references<cr>", km_opts)
