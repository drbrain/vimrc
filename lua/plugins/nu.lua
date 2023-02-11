return {
  {
    "LhKipp/nvim-nu",
    dependencies = {
      "null-ls.nvim",
      "nvim-treesitter",
    },

    event = {
      "FileType nu",
    },

    build = ":TSInstall nu",

    opts = {
      complete_cmd_names = true,
    },
  },
}
