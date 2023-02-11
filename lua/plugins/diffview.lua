return {
   {
    "sindrets/diffview.nvim",
    dependencies = "plenary.nvim",

    cmd = {
      "DiffviewLog",
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewRefresh",
      "DiffviewFocusFiles",
      "DiffviewFileHistory",
      "DiffviewToggleFiles",
    },

    opts = {
      enhanced_diff_hl = true,
      view = {
        default = {
          layout = "diff2_horizontal",
        },
        merge_tool = {
          layout = "diff4_mixed"
        }
      }
    }
  },
}
