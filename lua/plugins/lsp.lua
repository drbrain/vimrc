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
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "VonHeikemen/lsp-zero.nvim",
    },

    opts = {
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end
      }
    }
  },

  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      -- LSP Support
      "neovim/nvim-lspconfig",

      --   -- Autocompletion
      --   "hrsh7th/nvim-cmp",
      --   "hrsh7th/cmp-nvim-lsp",
      --   -- "hrsh7th/cmp-buffer",
      --   "hrsh7th/cmp-path",
      --   "saadparwaiz1/cmp_luasnip",
      --   "hrsh7th/cmp-nvim-lua",
      --
      --   -- Snippets
      --   "L3MON4D3/LuaSnip",
      --   "rafamadriz/friendly-snippets",
      --
      --   -- Language plugins
      --   "simrat39/rust-tools.nvim",
    },

    event = {
      "BufNewFile",
      "BufReadPre",
    },

    keys = {
      { "gr", "<Cmd>Telescope lsp_references<CR>",          desc = "Jump to references" },
      { "gt", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", desc = "Jump to Type Definition" },
    },

    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        local zero = require("lsp-zero")

        zero.default_keymaps({
          buffer = buffnr,
          exclude = {
            "<F2>", -- Rename symbol
            "<F4>", -- Code action
            "go",   -- Jump to type definition
          },
        })

        zero.buffer_autoformat()
      end)

      lsp_zero.format_on_save({
        format_opts = {
          async = false,
          timeout_ms = 5000,
        },
        servers = {
          ["rust_analyzer"] = { "rust" },
        }
      })

      lsp_zero.set_sign_icons({
        error = '',
        warn = '',
        hint = '',
        info = ''
      })
    end
  },

  {
    "glepnir/lspsaga.nvim",

    event = {
      "BufNewFile",
      "BufReadPre",
    },

    keys = {
      { "<Leader>rn", "<Cmd>Lspsaga rename<CR>",         desc = "Rename Symbol" },

      { "<Leader>ca", "<Cmd>Lspsaga code_action<CR>",    desc = "Code Action" },
      { "<Leader>ca", "<Cmd>Lspsaga code_action<CR>",    mode = "v",             desc = "Code Action" },

      { "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", desc = "Incoming Calls" },
      { "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", desc = "Outgoing Calls" },

      --     { "<Leader>sl", "<Cmd>Lspsaga show_line_diagnostics<CR>", desc = "Line Diagnostics" },
      --     { "<Leader>sc", "<Cmd>Lspsaga show_cursor_diagnostics<CR>", desc = "Cursor Diagnostics" },
      --     { "<Leader>sb", "<Cmd>Lspsaga show_buf_diagnostics<CR>", desc = "Buffer Diagnostics" },
      --
      --     { "[e", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Prev Diagnostic" },
      --     { "]e", "<Cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next Diagnostic" },
      --
      --     { "[E", function()
      --       require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
      --     end, desc = "Prev Error" },
      --     { "]E", function()
      --       require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
      --     end, desc = "Next Error" },
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
        enable = false,
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
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",

    event = {
      "BufNewFile",
      "BufReadPre",
    },

    config = function()
      require("lsp_lines").setup({})

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
