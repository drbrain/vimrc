local function init(use)
  use({
    "LhKipp/nvim-nu",

    after = "nvim-treesitter",

    run = ":TSInstall nu",

    config = function()
      require("nu").setup({
        complete_cmd_names = true,
      })
    end,
  })
end

return { init = init }
