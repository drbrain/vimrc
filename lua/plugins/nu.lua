return {
  {
    "LhKipp/nvim-nu",
    dependencies = {
      "null-ls.nvim",
      "nvim-treesitter",
    },

    build = ":TSInstall nu",

    config = function()
      require("nu").setup({
        complete_cmd_names = true,
      })
    end,
  },
}
