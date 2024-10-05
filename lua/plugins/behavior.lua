return {
  {
    {
      "folke/which-key.nvim",

      event = "VeryLazy",

      opts = {
        win = {
          border = "single",
          padding = { 0, 0 },
        },
      },

      config = function(_, opts)
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup(opts)
      end,
    },
  },

  {
    "godlygeek/tabular",

    cmd = {
      "Tab",
      "Tabularize",
    },

    keys = {
      { "<Leader>a=", ":Tabularize /=<CR>",    mode = "n", desc = "Align on =" },
      { "<Leader>a=", ":Tabularize /=<CR>",    mode = "v", desc = "Align on =" },

      { "<Leader>ah", ":Tabularize /=><CR>",   mode = "n", desc = "Align on =>" },
      { "<Leader>ah", ":Tabularize /=><CR>",   mode = "v", desc = "Align on =>" },

      { "<Leader>a:", ":Tabularize /:\\zs<CR>", mode = "n", desc = "Align after :" },
      { "<Leader>a:", ":Tabularize /:\\zs<CR>", mode = "v", desc = "Align after :" },
    }
  },

  {
    "junegunn/vim-easy-align",

    keys = {
      { "ga", "<Plug>(EasyAlign)", mode = "x", desc = "Easy Align" },
      { "ga", "<Plug>(EasyAlign)", mode = "n", desc = "Easy Align" },
    },
  },

  -- Help with f and t jumps
  {
    "jinh0/eyeliner.nvim",

    event = "VeryLazy",

    opts = {
      highlight_on_key = true,
    },
  },

  {
    "kevinhwang91/nvim-hlslens",

    keys = {
      { "n", [[<Cmd>execute("normal! " . v:count1 . "n")<CR>]], desc = "Repeat last search" },
      { "N", [[<Cmd>execute("normal! " . v:count1 . "N")<CR>]], desc = "Repeat last search in the opposite direction" },
      { "*", [[*]], desc = "Search forward for the cursor word" },
      { "#", [[#]], desc = "Search backward for the cursor word" },
      { "g*", [[g*]], desc = "Search forward for the cursor text" },
      { "g#", [[g#]], desc = "Search backward for the cursor text" },
    }
  },
}
