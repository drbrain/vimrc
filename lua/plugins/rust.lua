function init(use)
  use "rust-lang/rust.vim"

  use {
    "simrat39/rust-tools.nvim",
    after = "nvim-lspconfig",

    config = function()
      require("rust-tools").setup({})
    end,
  }
end

return { init = init }
