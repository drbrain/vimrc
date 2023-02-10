return {
  {
    "vim-ruby/vim-ruby",
    config = function()
      vim.ruby_no_comment_fold = 1

      vim.g.rubycomplete_buffer_loading      = 0
      vim.g.rubycomplete_classes_in_global   = 1
      vim.g.rubycomplete_rails               = 1
      vim.g.rubycomplete_include_object      = 1
      vim.g.rubycomplete_include_objectspace = 1
      vim.g.ruby_space_errors                = 1
      vim.g.ruby_no_expensive                = 1
    end
  },
}
