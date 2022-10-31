function init(use)
  use "godlygeek/tabular"

  use {
    "junegunn/vim-easy-align",

    config = function()
      -- Start interactive EasyAlign in visual mode (e.g. vipga)
      vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", { silent = true })

      -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
      vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", { silent = true })
    end
  }

  use {
    "jinh0/eyeliner.nvim",

    config = function()
      require("eyeliner").setup({
        highlight_on_key = true
      })
    end
  }
end

return { init = init }
