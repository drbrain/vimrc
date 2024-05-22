return {
  { "L3MON4D3/LuaSnip",                     event = "VeryLazy" },
  { "hrsh7th/cmp-nvim-lsp",                 event = "VeryLazy", dependencies = "nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp-document-symbol", event = "VeryLazy", dependencies = "nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp-signature-help",  event = "VeryLazy", dependencies = "nvim-cmp" },
  { "hrsh7th/cmp-nvim-lua",                 event = "VeryLazy", dependencies = "nvim-cmp" },
  { "hrsh7th/cmp-path",                     event = "VeryLazy", dependencies = "nvim-cmp" },
  { "onsails/lspkind.nvim",                 event = "VeryLazy"  },
  { "rafamadriz/friendly-snippets",         event = "VeryLazy"  },
  { "saadparwaiz1/cmp_luasnip",             event = "VeryLazy", dependencies = "nvim-cmp" },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "zjp-CN/nvim-cmp-lsp-rs",
    },
    event = "VeryLazy",

    opts = {
      sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lsp_document_symbol" },
        { name = "path" },
        { name = "nvim_lua" },
      },
    }
  },
}
