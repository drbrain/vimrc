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
      { "<Leader>Dc", "<Cmd>:DiffviewClose<CR>", desc = "Close diff view" },
      { "<Leader>Df", "<Cmd>:DiffviewFocusFiles<CR>", desc = "Focus diff view files" },
      { "<Leader>Do", "<Cmd>:DiffviewOpen<CR>", desc = "Open diff view" },
      { "<Leader>Dt", "<Cmd>:DiffviewToggleFiles<CR>", desc = "Toggle diff view files" },
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
