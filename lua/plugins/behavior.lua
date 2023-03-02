return {
 {
    {
      "folke/which-key.nvim",

      event = "VeryLazy",

      opts = {
        window = {
          border = "single",
          padding = { 0, 0, 0, 0 },
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

  -- normal mode keymaps:
  --
  -- `gcc` - Toggles the current line using linewise comment
  -- `gbc` - Toggles the current line using blockwise comment
  -- `[count]gcc` - Toggles the number of line given as a prefix-count using linewise
  -- `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
  -- `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
  -- `gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment
  -- `gco` - Insert comment to the next line and enters INSERT mode
  -- `gcO` - Insert comment to the previous line and enters INSERT mode
  -- `gcA` - Insert comment to end of the current line and enters INSERT mode
  --
  -- # Linewise
  --
  -- `gcw` - Toggle from the current cursor position to the next word
  -- `gc$` - Toggle from the current cursor position to the end of line
  -- `gc}` - Toggle until the next blank line
  -- `gc5j` - Toggle 5 lines after the current cursor position
  -- `gc8k` - Toggle 8 lines before the current cursor position
  -- `gcip` - Toggle inside of paragraph
  -- `gca}` - Toggle around curly brackets
  --
  -- # Blockwise
  --
  -- `gb2}` - Toggle until the 2 next blank line
  -- `gbaf` - Toggle comment around a function (w/ LSP/treesitter support)
  -- `gbac` - Toggle comment around a class (w/ LSP/treesitter support)
  --
  -- visual mode keymaps:
  --
  -- `gc` - Toggles the region using linewise comment
  -- `gb` - Toggles the region using blockwise comment
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },

    event = {
      "BufNewFile",
      "BufReadPre",
    },

    opts = function()
      return {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end
  },
}
