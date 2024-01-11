return {
  {
     "mfussenegger/nvim-lint",

    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        bash = { "hadolint", },
        gitcommit = { "gitlint", },
        yaml = { "yamllint", },
        zsh = { "zsh", },
      }

      vim.api.nvim_create_autocmd({
        "BufWritePost",
        "InsertLeave",
      }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end
  }
}
