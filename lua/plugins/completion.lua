return {
  { "L3MON4D3/LuaSnip",                     event = "VeryLazy" },
  { "hrsh7th/cmp-nvim-lsp",                 event = "VeryLazy", dependencies = "nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp-document-symbol", event = "VeryLazy", dependencies = "nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp-signature-help",  event = "VeryLazy", dependencies = "nvim-cmp" },
  { "hrsh7th/cmp-nvim-lua",                 event = "VeryLazy", dependencies = "nvim-cmp" },
  { "hrsh7th/cmp-path",                     event = "VeryLazy", dependencies = "nvim-cmp" },
  { "onsails/lspkind.nvim",                 event = "VeryLazy" },
  { "rafamadriz/friendly-snippets",         event = "VeryLazy" },
  { "saadparwaiz1/cmp_luasnip",             event = "VeryLazy", dependencies = "nvim-cmp" },

  {
    "hrsh7th/nvim-cmp",

    event = "InsertEnter",

    config = function()
      local cmp = require("cmp")

      cmp.setup({
        sources = {
          {
            name = "nvim_lsp"
          },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
        }),
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
      })
    end,
  },
}
