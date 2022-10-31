function init(use)
  use {
    "jinh0/eyeliner.nvim",

    config = function()
      require('eyeliner').setup({
        highlight_on_key = true
      })
    end
  }
end

return { init = init }
