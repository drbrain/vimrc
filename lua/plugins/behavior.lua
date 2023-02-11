return {
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

  {
    "jinh0/eyeliner.nvim",

    opts = {
      highlight_on_key = true,
    },
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
      "nvim-ts-context-commentstring",
    },

    event = {
      "BufEnter",
      "BufReadPre",
    },

    opts = function()
      return {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end
  },
}
