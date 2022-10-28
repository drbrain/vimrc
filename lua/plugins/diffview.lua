function init(use)
  use {
    "sindrets/diffview.nvim",
    requires = "plenary.nvim",

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
  }
end

return { init = init }
