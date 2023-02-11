require("leader")
require("plugins")
require("behavior")
require("gui")
require("search")

vim.api.nvim_exec([[
source ~/.config/nvim/autocmd.vim
source ~/.config/nvim/cdpath.vim
source ~/.config/nvim/highlight.vim
source ~/.config/nvim/map.lua
"source ~/.config/nvim/ruby-lang.vim
]], true)
