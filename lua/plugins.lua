vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"

  require("plugins/null-ls").init(use)
  require("plugins/nu").init(use)

end)
