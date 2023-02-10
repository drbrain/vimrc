vim.g.autoread = true
vim.g.autowrite = true
vim.g.backspace = "indent,eol,start"
vim.g.hidden = true
vim.g.nobackup = true
vim.g.shortmess = "c"
vim.g.wildmode = "list:longest"
vim.g.history=200
vim.g.shada="'100,<1000"

vim.api.nvim_set_keymap("t", "<D-Esc>", "<C-\\><C-n>", { noremap = true })
