return {
  {
    "folke/todo-comments.nvim",

    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },

    keys = {
      { "]T", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[T", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<Leader>xt", "<Cmd>TodoTrouble<CR>", desc = "Todo" },
      { "<Leader>xT", "<Cmd>TodoTrouble keywords=TODO,FIX,FIXME<CR>", desc = "Todo/Fix/Fixme" },
      { "<Leader>xF", "<Cmd>TodoTrouble keywords=FIX,FIXME<CR>", desc = "Todo/Fix/Fixme" },
      { "<Leader>st", "<Cmd>TodoTelescope<CR>", desc = "Todo" },
    },

    config = true,
  },
}
