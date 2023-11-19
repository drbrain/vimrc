return {
  {
    "LhKipp/nvim-nu",
    dependencies = {
      "null-ls.nvim",
      "nvim-treesitter",
    },

    build = ":TSInstall nu",

    opts = {
      use_lsp_features = false,
    },
  },
}
