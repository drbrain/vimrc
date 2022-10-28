vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"

  require("plugins/lsp").init(use)
  require("plugins/nu").init(use)
  require("plugins/null-ls").init(use)
  require("plugins/rust").init(use)
  require("plugins/telescope").init(use)
  require("plugins/treesitter").init(use)
end)
