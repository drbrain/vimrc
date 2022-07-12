local saga = require 'lspsaga'

saga.init_lsp_saga({
  border_style = "rounded",
  diagnostic_header = { "❌", "⚠️", "ℹ️", "💡" },
  code_action_lightbulb = {
    enable = true,
    sign = false,
    sign_priority = 0,
    virtual_text = true,
  },
})
