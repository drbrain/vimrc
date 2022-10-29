function init(use)
  use {
    "folke/todo-comments.nvim",
    branch = "neovim-pre-0.8.0",
    requires = "plenary.nvim",

    config = function()
      require("todo-comments").setup({})
    end,
  }
end

return { init = init }
