require("leader")
require("plugins")
require("behavior")
require("gui")
require("search")
require("autocommand")

vim.api.nvim_exec([[
set shell=/bin/zsh

source ~/.config/nvim/cdpath.vim
"source ~/.config/nvim/ruby-lang.vim
]], true)
