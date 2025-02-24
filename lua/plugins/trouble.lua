return {
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },

    keys = {
      { "<Leader>cl", "<Cmd>Trouble lsp toggle focus=false win.position=right<CR>", desc = "LSP Definitions / references / … (Trouble)" },
      { "<Leader>cs", "<Cmd>Trouble symbols toggle focus=false<CR>", desc = "Symbols (Trouble)" },
      { "<Leader>xL", "<Cmd>Trouble loclist toggle<CR>", desc = "Location List (trouble)" },
      { "<Leader>xQ", "<Cmd>Trouble qflist toggle<CR>", desc = "Quickfix List (trouble)" },
      { "<Leader>xX", "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics (Trouble)" },
      { "<Leader>xx", "<Cmd>Trouble diagnostics toggle<CR>", desc = "Toggle Diagnostics" },
    },
  },
}
