return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "plenary.nvim",
      "nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      -- test adapters follow
      "rouge8/neotest-rust",
    },

    keys = {
      { "<Leader>tn", "<Cmd>lua require('neotest').run.run()<CR>",                   desc = "Run nearest test" },
      { "<Leader>tf", "<Cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", desc = "Run all tests" },
      { "<Leader>tS", "<Cmd>lua require('neotest').run.stop()<CR>",                  desc = "Stop tests" },
      { "<Leader>tA", "<Cmd>lua require('neotest').run.attach()<CR>",                desc = "Attach to a test" },
      { "<Leader>ts", "<Cmd>lua require('neotest').summary.toggle()<CR>",            desc = "Toggle test summary" },
      { "<Leader>to", "<Cmd>lua require('neotest').output.open()<CR>",               desc = "Show test output" },
      { "<Leader>[t", "<Cmd>lua require('neotest').jump.prev()<CR>",                 desc = "Next failed test" },
      { "<Leader>]t", "<Cmd>lua require('neotest').jump.next()<CR>",                 desc = "Previous failed test" },
    },

    opts = function()
      return {
        adapters = {
          require("rustaceanvim.neotest")
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
      }
    end,
  },
}
