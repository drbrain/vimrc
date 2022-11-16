function init(use)
  use {
    "folke/todo-comments.nvim",
    requires = "plenary.nvim",

    config = function()
      require("todo-comments").setup({})
    end,
  }
end

return { init = init }
