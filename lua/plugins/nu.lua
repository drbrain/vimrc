return {
  {
    "LhKipp/nvim-nu",
    dependencies = {
      "nvim-treesitter",
    },

    build = ":TSInstall nu",

    opts = {
      use_lsp_features = false,
    },
  },
}
