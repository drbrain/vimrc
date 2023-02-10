return {
   {
    "sindrets/diffview.nvim",
    dependencies = "plenary.nvim",

    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
        view = {
          default = {
            layout = "diff2_horizontal",
          },
          merge_tool = {
            layout = "diff4_mixed"
          }
        }
      })
    end,
  },
}
