vim.g.hlsearch = true
vim.g.incsearch = true
vim.g.showmatch = true

vim.g.ignorecase = true
vim.g.infercase = true
vim.g.smartcase = true

vim.api.nvim_set_keymap("n", "<C-n>", "<Cmd>:noh<CR>", { desc = "Clear Search Highlight" })
