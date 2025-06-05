local function mdbook_ls_setup(capabilities)
  local lspconfig = require("lspconfig")

  local function execute_command_with_params(params)
    local clients = lspconfig.util.get_lsp_clients {
      bufnr = vim.api.nvim_get_current_buf(),
      name = "mdbook_ls",
    }

    for _, client in ipairs(clients) do
      client.request("workspace/executeCommand", params, nil, 0)
    end
  end

  local function open_preview()
    local params = {
      command = "open_preview",
      arguments = { "127.0.0.1:33000", vim.api.nvim_buf_get_name(0) },
    }

    execute_command_with_params(params)
  end

  local function stop_preview()
    local params = {
      command = "stop_preview",
      arguments = {},
    }

    execute_command_with_params(params)
  end

  require("lspconfig.configs")["mdbook_ls"] = {
    default_config = {
      cmd = { "mdbook-ls" },
      filetypes = { "markdown" },
      root_dir = lspconfig.util.root_pattern("book.toml"),
    },

    commands = {
      MDBookLSOpenPreview = {
        open_preview,
        description = "Open mdBook-LS preview",
      },
      MDBookLSStopPreview = {
        stop_preview,
        description = "Stop mdBook-LS preview",
      },
    },

    docs = {
      description = [[The mdBook Language Server for previewing mdBook projects live.]],
    },
  }

  lspconfig["mdbook_ls"].setup {
    capabilities = capabilities,
  }
end

return {
  {
    "neovim/nvim-lspconfig",

    event = {
      "BufNewFile",
      "BufReadPre",
    },
  },

  {
    "williamboman/mason.nvim",

    cmd = "Mason",
    keys = {
      { "<Leader>cm", "<Cmd>Mason<CR>", desc = "Mason" }
    },

    opts = {
      ensure_installed = {
        "stylua",
      },
    },

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
          if server_name == "rust_analyzer" then
          elseif server_name == "dockerls" then
            require("lspconfig")[server_name].setup({
              settings = {
                docker = {
                  languageserver = {
                    formatter = {
                      ignoreMultilineInstructions = true,
                    },
                  },
                }
              }
            })
          else
            require("lspconfig")[server_name].setup({})
          end
        end
      }
    },

    config = function(_, opts)
      require('mason-lspconfig').setup(opts)

      local capabilities = require('cmp_nvim_lsp')
          .default_capabilities(vim.lsp.protocol.make_client_capabilities())

      mdbook_ls_setup(capabilities)
    end
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
      { "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>",      desc = "Jump to definition" },
      { "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>",     desc = "Jump to declaration" },
      { "gI", "<Cmd>lua vim.lsp.buf.implementation()<CR>",  desc = "Jump to implementation" },
    },

    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable()
        end

        local zero = require("lsp-zero")

        zero.default_keymaps({
          buffer = bufnr,
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
        }
      })

      lsp_zero.set_sign_icons({
        error = "",
        warn = "",
        hint = "",
        info = "",
      })

      local cmp = require("cmp")
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup({
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        formatting = {
          details = true,
          fields = { "abbr", "kind", "menu" },
          format = require("lspkind").cmp_format({
            mode = "symbol",
            maxwidth = 80,
            ellipsis_char = "…",
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp_action.luasnip_supertab(),
          ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
        }),
        preselect = "item",
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "nvim_lsp_document_symbol" },
          { name = "path" },
          { name = "nvim_lua" },
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })

      require("lspconfig").nushell.setup({})
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
        enable = true,
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
    "rachartier/tiny-inline-diagnostic.nvim",

    event = {
      "BufReadPre",
      "LspAttach",
    },
    priority = 2000,

    config = function(opts)
      require("tiny-inline-diagnostic").setup(opts)

      vim.diagnostic.config({
        virtual_text = false
      })
    end,

    opts = {
      preset = "modern",
      options = {
        always_show = true,
        multilines = {
          enabled = true,
        },
        transparent_bg = true,
        use_icons_from_diagnostic = true,
      },
    },
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
