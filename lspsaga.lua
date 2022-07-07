local saga = require 'lspsaga'

saga.init_lsp_saga({
  border_style = "rounded",
  diagnostic_header = { "❌", "⚠️", "ℹ️", "💡" },
})
