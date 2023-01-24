local function init(use)
  use { "L3MON4D3/LuaSnip" }
  use { "hrsh7th/cmp-nvim-lua",                 requires = "nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp",                 requires = "nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp-document-symbol", requires = "nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp-signature-help",  requires = "nvim-cmp" }
  use { "hrsh7th/cmp-path",                     requires = "nvim-cmp" }
  use { "hrsh7th/nvim-cmp" }
  use { "onsails/lspkind.nvim" }
  use { "rafamadriz/friendly-snippets" }
  use { "saadparwaiz1/cmp_luasnip",             requires = "nvim-cmp" }
end

return { init = init }
