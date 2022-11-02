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

      vim.keymap.set("n", "<Leader>Ct", crates.toggle, opts)
      vim.keymap.set("n", "<Leader>Cr", crates.reload, opts)

      vim.keymap.set("n", "<Leader>Cv", crates.show_versions_popup, opts)
      vim.keymap.set("n", "<Leader>Cf", crates.show_features_popup, opts)
      vim.keymap.set("n", "<Leader>Cd", crates.show_dependencies_popup, opts)

      vim.keymap.set("n", "<Leader>Cu", crates.update_crate, opts)
      vim.keymap.set("v", "<Leader>Cu", crates.update_crates, opts)
      vim.keymap.set("n", "<Leader>Ca", crates.update_all_crates, opts)
      vim.keymap.set("n", "<Leader>CU", crates.upgrade_crate, opts)
      vim.keymap.set("v", "<Leader>CU", crates.upgrade_crates, opts)
      vim.keymap.set("n", "<Leader>CA", crates.upgrade_all_crates, opts)

      vim.keymap.set("n", "<Leader>CH", crates.open_homepage, opts)
      vim.keymap.set("n", "<Leader>CR", crates.open_repository, opts)
      vim.keymap.set("n", "<Leader>CD", crates.open_documentation, opts)
      vim.keymap.set("n", "<Leader>CC", crates.open_crates_io, opts)
    end,
}
end

return { init = init }
