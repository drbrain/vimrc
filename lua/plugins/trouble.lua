return {
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-web-devicons",
      "DaikyXendo/nvim-material-icon",
    },

    config = function()
      require("trouble").setup({
        height = 5,
        use_diagnostic_signs = true,
      })

      local opts = { silent = true, noremap = true }

      vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
      vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
      vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
      vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
      vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
      vim.api.nvim_set_keymap("n", "<leader>xL", "<cmd>Trouble lsp_references<cr>", opts)
    end
  },
}
