vim.opt.rtp:append("/opt/homebrew/opt/fzf")

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "plenary.nvim",
      "telescope-fzf-native.nvim",
    },

    config = function()
      local telescope = require("telescope")

      telescope.load_extension("emoji")
      telescope.load_extension("fzf")

      local options = { noremap = true }
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>fb", builtin.buffers, options)
      vim.keymap.set("n", "<leader>ff", builtin.find_files, options)
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, options)
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, options)
      vim.keymap.set("n", "<leader>fi", builtin.lsp_incoming_calls, options)
      vim.keymap.set("n", "<leader>fo", builtin.lsp_outgoing_calls, options)
      vim.keymap.set("n", "<leader>fs", builtin.lsp_workspace_symbols, options)
    end,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },

  "xiyaowong/telescope-emoji.nvim",

}
