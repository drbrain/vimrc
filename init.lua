require("leader")
require("plugins")

vim.api.nvim_exec([[
source ~/.config/nvim/gui.vim
source ~/.config/nvim/behavior.vim
source ~/.config/nvim/autocmd.vim
source ~/.config/nvim/cdpath.vim
source ~/.config/nvim/highlight.vim
source ~/.config/nvim/map.lua
"source ~/.config/nvim/ruby-lang.vim
source ~/.config/nvim/search.vim
source ~/.config/nvim/terminal.vim
]], true)
