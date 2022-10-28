vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use 'wbthomason/packer.nvim'

  require('plugins/null-ls').init(use)

  use "nvim-lua/plenary.nvim"

end)
