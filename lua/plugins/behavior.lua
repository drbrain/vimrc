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

  use {
    "lewis6991/spellsitter.nvim",

    config = function()
      require("spellsitter").setup({
        highlight = {
          enable = true,
        }
      })

      vim.o.spelllang = "en_us"

      local spell_group = vim.api.nvim_create_augroup("spell", { clear = true })
      -- disable spellchecking in the embeded terminal
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "*",
        command = "setlocal nospell",
        group = spell_group,
      })

      -- Disable spelling for file types
      -- vim.api.nvim_create_autocmd("FileType", {
      --   pattern = { "python", "lua" },
      --   command = "setlocal nospell",
      --   group = spell_group,
      -- })
    end
  }
end

return { init = init }
