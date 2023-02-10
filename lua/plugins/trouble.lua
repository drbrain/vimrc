return {
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },

    keys = {
      { "<Leader>xx", "<Cmd>TroubleToggle<CR>", desc = "Toggle Diagnostics" },
      { "<Leader>xw", "<Cmd>Trouble workspace_diagnostics<CR>", desc = "Workspace Diagnostics" },
      { "<Leader>xd", "<Cmd>Trouble document_diagnostics<CR>", desc = "Document Diagnostics" },
      { "<Leader>xl", "<Cmd>Trouble loclist<CR>", desc = "Location List" },
      { "<Leader>xq", "<Cmd>Trouble quickfix<CR>", desc = "Quickfix List" },
      { "<Leader>xL", "<Cmd>Trouble lsp_references<CR>", desc = "Reference List" },
    },

    opts = {
      height = 6,
      use_diagnostic_signs = true,
    },
  },
}
