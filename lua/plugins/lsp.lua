return {
  "neovim/nvim-lspconfig",
  "williamboman/mason-lspconfig.nvim",
  "williamboman/mason.nvim",

  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      -- LSP Support
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Autocompletion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      -- "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",

      -- Snippets
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",

      -- Language plugins
      "simrat39/rust-tools.nvim",
    },

    config = function()
      local lsp = require("lsp-zero")
      lsp.preset("recommended")

      lsp.set_preferences({
        set_lsp_keymaps = false,
      })

      local map_keys_on_attach = function(_, bufnr)
        local map = function(m, lhs, rhs)
          local key_opts = { noremap = true, silent = true }
          vim.api.nvim_buf_set_keymap(bufnr, m, lhs, rhs, key_opts)
        end

        map("n", "K",     "<Cmd>lua vim.lsp.buf.hover()<CR>")
        map("n", "gd",    "<Cmd>lua vim.lsp.buf.definition()<CR>")
        map("n", "gD",    "<Cmd>lua vim.lsp.buf.declaration()<CR>")
        map("n", "gi",    "<Cmd>lua vim.lsp.buf.implementation()<CR>")
        map("n", "gt",    "<Cmd>lua vim.lsp.buf.type_definition()<CR>")
        map("n", "gr",    "<Cmd>lua vim.lsp.buf.references()<CR>")
        map("n", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>")

        map("n", "gl",    "<Cmd>lua vim.diagnostic.open_float()<CR>")
      end

      lsp.on_attach(map_keys_on_attach)

      -- https://github.com/VonHeikemen/lsp-zero.nvim/discussions/5
      local lsp_rust = lsp.build_options("rust_analyzer", {
        on_attach = map_keys_on_attach,
      })

      -- Configure lua language server for neovim
      lsp.nvim_workspace()

      lsp.setup()

      require("rust-tools").setup({
        server = lsp_rust
      })
    end
  },

  {
    "glepnir/lspsaga.nvim",

    config = function()
      local saga = require("lspsaga")
      saga.setup({
        border_style = "rounded",
        code_action = {
          num_shortcut = true,
        },
        lightbulb = {
          enable = false,
        },
        symbol_in_winbar = {
          enable = true,
          in_custom = true,
        }
      })

      local diagnostic = vim.diagnostic
      local map = vim.keymap.set
      map("n", "<Leader>rn", "<Cmd>Lspsaga rename<CR>")

      map("n", "<Leader>ca", "<Cmd>Lspsaga code_action<CR>")
      map("v", "<Leader>ca", "<Cmd>Lspsaga code_action<CR>")

      map("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
      map("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

      map("n", "<Leader>sl", "<Cmd>Lspsaga show_line_diagnostics<CR>")
      map("n", "<Leader>sc", "<Cmd>Lspsaga show_cursor_diagnostics<CR>")
      map("n", "<Leader>sb", "<Cmd>Lspsaga show_buf_diagnostics<CR>")

      map("n", "[e", "<Cmd>Lspsaga diagnostic_jump_prev<CR>")
      map("n", "]e", "<Cmd>Lspsaga diagnostic_jump_next<CR>")

      map("n", "[E", function()
        require("lspsaga.diagnostic").goto_prev({ severity = diagnostic.severity.ERROR })
      end)
      map("n", "]E", function()
        require("lspsaga.diagnostic").goto_next({ severity = diagnostic.severity.ERROR })
      end)
    end,
  },

  {
    "Maan2003/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()

      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  },

  {
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

      local options = { noremap = true, silent = true }
      vim.keymap.set("n", "<Leader>so", "<Cmd>SymbolsOutline<CR>", options)
    end
  },
}
