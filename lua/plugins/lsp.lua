local function init(use)
  use {
    "neovim/nvim-lspconfig",
    after = "mason-lspconfig.nvim",

    config = function()
    end,
  }

  use {
    "williamboman/mason.nvim",

    config = function()
      require("mason").setup()
    end,
  }

  use {
    "williamboman/mason-lspconfig.nvim",

    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "rust_analyzer" }
      })

      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      end

      local lsp_flags = {
        -- This is the default in Nvim 0.7+
        debounce_text_changes = 150,
      }

      -- I think I could not get `rustup run stable rust-analyzer` to work inside vimr
      -- require('lspconfig')['rust_analyzer'].setup {
      --   -- cmd = { "rustup", "run", "stable", "rust-analyzer" },
      --   on_attach = on_attach,
      --   flags = lsp_flags,
      --   -- Server-specific settings...
      --   settings = {
      --     ["rust-analyzer"] = {}
      --   }
      -- }
    end,
  }
end

return { init = init }
