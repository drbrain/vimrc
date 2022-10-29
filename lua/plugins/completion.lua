function init(use)
  use {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          -- Add tab support
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          })

        }),
        sources = cmp.config.sources({
          { name = "buffer" },
          { name = "cmdline" },
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "vsnip" },
        }),
      })

      cmp.setup.cmdline(":", {
        sources = {
          { name = "cmdline" }
        }
      })

      cmp.setup.cmdline("/", {
        sources = {
          { name = "buffer" }
        }
      })
    end,
  }

  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-vsnip"
  use "hrsh7th/vim-vsnip"
end

return { init = init }
