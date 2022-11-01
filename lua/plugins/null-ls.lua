local function init(use)
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = "plenary.nvim",

    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.completion.spell,
        },
      })
    end,

  })
end

return { init = init }
