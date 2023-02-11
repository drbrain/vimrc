return {
  "neovim/nvim-lspconfig",
  "williamboman/mason-lspconfig.nvim",

  {
    "williamboman/mason.nvim",

    cmd = "Mason",
    keys = {
      { "<Leader>cm", "<Cmd>Mason<CR>", desc = "Mason" }
    },

    opts = {
      ensure_installed = {
        "rust-analyzer",
        "rustfmt",
        "stylua",
      },
    },

    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },

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

    event = {
      "BufEnter",
      "BufReadPre",
    },

    keys = {
      { "K",     "<Cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover" },
      { "gd",    "<Cmd>lua vim.lsp.buf.definition()<CR>", desc = "Jump to Definition" },
      { "gD",    "<Cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Jump to Declaration" },
      { "gi",    "<Cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Jump to Implementation" },
      { "gt",    "<Cmd>lua vim.lsp.buf.type_definition()<CR>", desc = "Jump to Type Definition" },
      { "gr",    "<Cmd>lua vim.lsp.buf.references()<CR>", desc = "Jump to references" },
      { "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
      { "gl",    "<Cmd>lua vim.diagnostic.open_float()<CR>", desc = "Open float" },
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

    event = {
      "BufEnter",
      "BufReadPre",
    },


    keys = {
      { "<Leader>rn", "<Cmd>Lspsaga rename<CR>", desc = "Rename Symbol" },

      { "<Leader>ca", "<Cmd>Lspsaga code_action<CR>", desc = "Code Action" },
      { "<Leader>ca", "<Cmd>Lspsaga code_action<CR>", mode = "v", desc = "Code Action" },

      { "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", desc = "Incoming Calls" },
      { "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", desc = "Outgoing Calls" },

      { "<Leader>sl", "<Cmd>Lspsaga show_line_diagnostics<CR>", desc = "Line Diagnostics" },
      { "<Leader>sc", "<Cmd>Lspsaga show_cursor_diagnostics<CR>", desc = "Cursor Diagnostics" },
      { "<Leader>sb", "<Cmd>Lspsaga show_buf_diagnostics<CR>", desc = "Buffer Diagnostics" },

      { "[e", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Prev Diagnostic" },
      { "]e", "<Cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next Diagnostic" },

      { "[E", function()
        require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
      end, desc = "Prev Error" },
      { "]E", function()
        require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
      end, desc = "Next Error" },
    },

    opts = {
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
    },
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

    keys = {
      { "<Leader>so", "<Cmd>SymbolsOutline<CR>", desc = "Symbol Outline" },
    },

    opts = {
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
    },
  },
}
