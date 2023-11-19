return {
  {
    "neovim/nvim-lspconfig",

    event = {
      "BufNewFile",
      "BufReadPre",
    },

    config = function()
      local config = require("lspconfig.configs")
      local util = require("lspconfig.util")

      config.nu = {
        default_config = {
          name = "nu",
          cmd = { "nu", "--lsp" },
          filetypes = { "nu" },
          root_dir = util.find_git_ancestor
        }
      }
    end
  },

  {
    "williamboman/mason.nvim",

    cmd = "Mason",
    keys = {
      { "<Leader>cm", "<Cmd>Mason<CR>", desc = "Mason" }
    },

    opts = {
      ensure_installed = {
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
      "BufNewFile",
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

      lsp.ensure_installed({
        "rust_analyzer",
      })

      lsp.set_preferences({
        set_lsp_keymaps = false,
      })

      -- https://github.com/VonHeikemen/lsp-zero.nvim/discussions/5
      local lsp_rust = lsp.build_options("rust_analyzer", {})

      lsp.nvim_workspace({
        library = vim.api.nvim_get_runtime_file('', true)
      })

      lsp.configure('nu', { force_setup = true })

      lsp.setup()

      require("rust-tools").setup({
        server = lsp_rust
      })
    end
  },

  {
    "glepnir/lspsaga.nvim",

    dependencies = {
      "gitsigns.nvim",
    },

    event = {
      "BufNewFile",
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
    "j-hui/fidget.nvim",

    event = {
      "LspAttach",
    },

    opts = {
      progress = {
        display = {
          progress_icon = {
            pattern = "moon",
          }
        },
      },
      notification = {
        window = {
          winblend = 10,
          border = "rounded",
        }
      }
    },
  },

  {
    "Maan2003/lsp_lines.nvim",

    event = {
      "BufNewFile",
      "BufReadPre",
    },

    config = function()
      require("lsp_lines").setup()

      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  },

  {
    "hedyhli/outline.nvim",

    keys = {
      { "<Leader>so", "<Cmd>Outline<CR>", desc = "Symbol Outline" },
    },

    opts = {
      auto_close = true,
      auto_jump = true,
    },
  },
}
