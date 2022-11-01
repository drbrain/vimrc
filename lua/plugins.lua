vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  -- TODO: remove when updating to NeoVim 8
  use "antoinemadec/FixCursorHold.nvim"

  require("plugins/appearance").init(use)
  require("plugins/behavior").init(use)
  require("plugins/completion").init(use)
  require("plugins/diffview").init(use)
  require("plugins/git").init(use)
  require("plugins/lsp").init(use)
  require("plugins/nu").init(use)
  require("plugins/null-ls").init(use)
  require("plugins/ruby").init(use)
  require("plugins/rust").init(use)
  require("plugins/telescope").init(use)
  require("plugins/test").init(use)
  require("plugins/todo-comments").init(use)
  require("plugins/treesitter").init(use)
  require("plugins/trouble").init(use)
end)
