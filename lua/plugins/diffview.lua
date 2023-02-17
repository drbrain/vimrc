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

    keys = {
      { "<Leader>DO", "<Cmd>:DiffviewOpen<CR>", desc = "Open diff view" },
      { "<Leader>DC", "<Cmd>:DiffviewClose<CR>", desc = "Close diff view" },
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
