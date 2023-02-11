return {
  {
    "LhKipp/nvim-nu",
    dependencies = {
      "null-ls.nvim",
      "nvim-treesitter",
    },

    event = {
      "BufReadPre *.nu",
      "BufEnter *.nu",
    },

    build = ":TSInstall nu",

    opts = {
      complete_cmd_names = true,
    },
  },
}
