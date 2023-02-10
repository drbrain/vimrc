return {
  {
    "folke/todo-comments.nvim",
    dependencies = "plenary.nvim",

    config = function()
      require("todo-comments").setup({})
    end,
  },
}
