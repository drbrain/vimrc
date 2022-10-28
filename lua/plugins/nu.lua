local function init(use)
  use({
    "LhKipp/nvim-nu",

    config = function()
      vim.cmd "TSInstall nu"

      require("nu").setup({
        complete_cmd_names = true,
      })
    end,
  })
end

return { init = init }
