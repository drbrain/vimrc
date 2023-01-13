local function init(use)
  use {
    "neovim/nvim-lspconfig",
    after = "mason-lspconfig.nvim",

    config = function()
      local lspconfig = require("lspconfig")
      local lsp_defaults = lspconfig.util.default_config

      lsp_defaults.capabilities = vim.tbl_deep_extend(
        "force",
        lsp_defaults.capabilities,
        require("cmp_nvim_lsp").default_capabilities()
      )

      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
      end

      local lsp_flags = {
        -- This is the default in Nvim 0.7+
        debounce_text_changes = 150,
      }

      -- See :help mason-lspconfig-automatic-server-setup
      require("mason-lspconfig").setup_handlers({
        function (server_name)
          lspconfig[server_name].setup({
            on_attach = on_attach,
            flags = lsp_flags,
          })
        end
      })
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
    end,
  }

  use({
    "glepnir/lspsaga.nvim",
    config = function()
      local saga = require("lspsaga")

      saga.setup({
        border_style = "rounded",
        diagnostic_header = { "❌", "⚠️", "ℹ️", "💡" },
        code_action_lightbulb = {
          enable = true,
          sign = false,
          sign_priority = 0,
          virtual_text = false,
        },
        code_action_num_shortcut = true,
        symbol_in_winbar = {
          enable = true,
          in_custom = true,
        }
      })
    end,
  })

  use {
    "Maan2003/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()

      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  }

  use {
    "simrat39/symbols-outline.nvim",

    config = function()
      require("symbols-outline").setup({
        auto_close = true,
        symbols = {
          File          = { icon = "" },
          Module        = { icon = "" },
          Namespace     = { icon = "" },
          Package       = { icon = "" },
          Class         = { icon = "𝓒" },
          Method        = { icon = "ƒ" },
          Property      = { icon = "" },
          Field         = { icon = "" },
          Constructor   = { icon = "" },
          Enum          = { icon = "ℰ" },
          Interface     = { icon = "ﰮ" },
          Function      = { icon = "ﬦ" },
          Variable      = { icon = "" },
          Constant      = { icon = "" },
          String        = { icon = "𝓐" },
          Number        = { icon = "#" },
          Boolean       = { icon = "⊨" },
          Array         = { icon = "" },
          Object        = { icon = "⦿" },
          Key           = { icon = "" },
          Null          = { icon = "ﳠ" },
          EnumMember    = { icon = "" },
          Struct        = { icon = "𝓢" },
          Event         = { icon = "" },
          Operator      = { icon = "+" },
          TypeParameter = { icon = "𝙏" }
        }
      })

      vim.keymap.set("n", "<Leader>so", "<Cmd>SymbolsOutline<CR>", options)
    end
  }
end

return { init = init }
