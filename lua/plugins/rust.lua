function init(use)
  use "rust-lang/rust.vim"

  use {
    "simrat39/rust-tools.nvim",
    after = "nvim-lspconfig",

    config = function()
      require("rust-tools").setup({})
    end,
  }

  use {
    "saecki/crates.nvim",
    requires = "plenary.nvim",
    after = "null-ls.nvim",

    config = function()
      local crates = require("crates")

      crates.setup({
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      })

      local opts = { noremap = true, silent = true }

      vim.keymap.set("n", "<Leader>ct", crates.toggle, opts)
      vim.keymap.set("n", "<Leader>cr", crates.reload, opts)

      vim.keymap.set("n", "<Leader>cv", crates.show_versions_popup, opts)
      vim.keymap.set("n", "<Leader>cf", crates.show_features_popup, opts)
      vim.keymap.set("n", "<Leader>cd", crates.show_dependencies_popup, opts)

      vim.keymap.set("n", "<Leader>cu", crates.update_crate, opts)
      vim.keymap.set("v", "<Leader>cu", crates.update_crates, opts)
      vim.keymap.set("n", "<Leader>ca", crates.update_all_crates, opts)
      vim.keymap.set("n", "<Leader>cU", crates.upgrade_crate, opts)
      vim.keymap.set("v", "<Leader>cU", crates.upgrade_crates, opts)
      vim.keymap.set("n", "<Leader>cA", crates.upgrade_all_crates, opts)

      vim.keymap.set("n", "<Leader>cH", crates.open_homepage, opts)
      vim.keymap.set("n", "<Leader>cR", crates.open_repository, opts)
      vim.keymap.set("n", "<Leader>cD", crates.open_documentation, opts)
      vim.keymap.set("n", "<Leader>cC", crates.open_crates_io, opts)
    end,
}
end

return { init = init }
