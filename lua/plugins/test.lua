function init(use)
  use {
    "nvim-neotest/neotest",
    requires = {
      "plenary.nvim",
      "nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      -- test adapters follow
      "neotest-rust",
    },

    config = function()
      local neotest = require("neotest")
      neotest.setup({
        adapters = {
          require("neotest-rust")
        },
        status = {
          enabled = true,
          signs = true,
          virtual_text = true,
        },
        output = {
          enabled = true,
          enter = true,
          auto_close = true,
        },
        icons = {
          running_animated = {
            "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
            "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
          },
          passed = "",
          running = "",
          failed = "",
          skipped = "",
          unknown = "ﬤ",
        },
      })

      local options = { noremap = true }
      -- test running
      vim.keymap.set("n", "<Leader>tn", "<Cmd>lua require('neotest').run.run()<CR>", options)
      vim.keymap.set("n", "<Leader>tf", "<Cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", options)
      vim.keymap.set("n", "<Leader>tS", "<Cmd>lua require('neotest').run.stop()<CR>", options)
      vim.keymap.set("n", "<Leader>tA", "<Cmd>lua require('neotest').run.attach()<CR>", options)

      -- toggle summary
      vim.keymap.set("n", "<Leader>ts", "<Cmd>lua require('neotest').summary.toggle()<CR>", options)

      -- jump
      vim.keymap.set("n", "<Leader>t[", "<Cmd>lua require('neotest').jump.prev()<CR>", options)
      vim.keymap.set("n", "<Leader>t]", "<Cmd>lua require('neotest').jump.next()<CR>", options)
    end
  }

  use "rouge8/neotest-rust"
end

return { init = init }
