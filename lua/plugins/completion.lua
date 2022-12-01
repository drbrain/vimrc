function init(use)
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "lspkind.nvim",
      "nvim-material-icon",
    },
    after = {
      "nvim-lspconfig",
    },

    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          -- up
          ["<Up>"]  = cmp.mapping.select_prev_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),

          -- down
          ["<Down>"] = cmp.mapping.select_next_item(),
          ["<C-n>"]  = cmp.mapping.select_next_item(),
          ["<Tab>"] = cmp.mapping.select_next_item(),

          -- scroll
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),

          -- cancel
          ["<C-e>"] = cmp.mapping.abort(),

          -- complete
          ["<C-Space>"] = cmp.mapping.complete(),

          -- confirm and insert
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          })
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp", keyword_length = 3 },
          { name = "nvim_lsp_signature_help" },
          { name = "vsnip" },
          { name = "path" },
          { name = "crates" },
        }, {
          {
            name = "buffer",
            option = {
              keyword_length = 5,
            },
          },
        }),
        formatting = {
          fields = { "menu", "abbr", "kind" },
          format = function(entry, vim_item)
            if vim.tbl_contains({ 'path' }, entry.source.name) then
              local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
              if icon then
                vim_item.kind = icon
                vim_item.kind_hl_group = hl_group
                return vim_item
              end
            end
            return require("lspkind").cmp_format({ with_text = false })(entry, vim_item)
          end
        },
      })

      cmp.setup.cmdline("/", {
        sources = cmp.config.sources({
          { name = "nvim_lsp_document_symbol" }
        }, {
          { name = "buffer" }
        })
      })

      vim.opt.completeopt = { "menu", "menuone", "noselect" }
    end,
  }

  use { "hrsh7th/cmp-buffer",                   requires = "nvim-cmp" }
  -- use { "hrsh7th/cmp-nvim-lsp",                 requires = "nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp-document-symbol", requires = "nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp-signature-help",  requires = "nvim-cmp" }
  use { "hrsh7th/cmp-path",                     requires = "nvim-cmp" }
  use { "hrsh7th/cmp-vsnip",                    requires = "nvim-cmp" }
  use { "hrsh7th/vim-vsnip",                    requires = "nvim-cmp" }
  use { "onsails/lspkind.nvim" }
end

return { init = init }
