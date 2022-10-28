local function init(use)
  use {
    "nvim-telescope/telescope.nvim",

    config = function()
      require("telescope").load_extension("emoji")
      require("telescope").load_extension("fzf")

      local options = { noremap = true }
      local telescope = require("telescope.builtin")
      vim.keymap.set("n", "<leader>fb", telescope.buffers, options)
      vim.keymap.set("n", "<leader>ff", telescope.find_files, options)
      vim.keymap.set("n", "<leader>fg", telescope.live_grep, options)
      vim.keymap.set("n", "<leader>fh", telescope.help_tags, options)
      vim.keymap.set("n", "<leader>fi", telescope.lsp_incoming_calls, options)
      vim.keymap.set("n", "<leader>fo", telescope.lsp_outgoing_calls, options)
      vim.keymap.set("n", "<leader>fs", telescope.lsp_workspace_symbols, options)
    end,

    requires = "plenary.nvim",
    after = "telescope-fzf-native.nvim",
  }

  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  }

  use "xiyaowong/telescope-emoji.nvim"
end

return { init = init }
