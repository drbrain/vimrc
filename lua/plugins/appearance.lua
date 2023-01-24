function init(use)
  vim.opt.termguicolors = true

  use "NLKNguyen/papercolor-theme"

  use {
    "folke/tokyonight.nvim",

    config = function()
      vim.o.background = "dark"

      require("tokyonight").setup({
        style = "night",
        on_colors = function(colors)
          colors.bg = "#13151F"
          colors.bg_dark = "#0F1119"
        end
      })

      vim.cmd[[colorscheme tokyonight-night]]

      vim.cmd("hi LineNr guifg=#ff9e64")
      vim.cmd("hi LineNrAbove guifg=#7dcfff")
      vim.cmd("hi LineNrBelow guifg=#bb9af7")

      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.numberwidth = 3

      vim.opt.signcolumn = "yes:3"

      vim.opt.visualbell = true

      vim.opt.showcmd = true

      vim.opt.ruler = true
      vim.opt.laststatus = 2

      vim.opt.showbreak = "> "

      vim.opt.diffopt = "filler,context:8,foldcolumn:0"

      vim.g.airline_theme = "deus"
    end,
  }

  use {
    "nvim-lualine/lualine.nvim",
    requires = {
      "nvim-material-icon",
      "nvim-web-devicons",
    },
    after = {
      "tokyonight.nvim",
    },

    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight"
        },
        sections = {
          lualine_x = {
            {
              "filetype",
              icon_only = true,
            }
          },
          lualine_z = {
            "%B",
            "location",
          }
        }
      })
    end,
  }

  use {
    "gelguy/wilder.nvim",
    requires = {
      "nvim-cmp",
      "nvim-material-icon",
      "nvim-web-devicons",
    },
    config = function()
      local wilder = require("wilder")
      wilder.setup({modes = {":", "/", "?"}})

      wilder.set_option(
        "renderer",
        wilder.popupmenu_renderer(
          wilder.popupmenu_border_theme({
            border = "rounded",
            highlighter = wilder.basic_highlighter(),
            highlights = {
              accent = wilder.make_hl("WilderAccent", "Pmenu", {{a = 1}, {a = 1}, {foreground = "#bb7cd7"}}),
              border = "Normal",
            },
            left = {
              " ", wilder.popupmenu_devicons(),
            },
            right = {
              " ", wilder.popupmenu_scrollbar(),
            },
          })
        )
      )
    end,
  }

  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "*"; -- Highlight all files, but customize some others.
        css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
        html = { names = false; } -- Disable parsing "names" like Blue or Gray
      })
    end,
  }

  -- We override this with nvim-material-icon, but need it for compatibility
  use "kyazdani42/nvim-web-devicons"

  use {
    "DaikyXendo/nvim-material-icon",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      local web_devicons_ok, web_devicons = pcall(require, "nvim-web-devicons")
      if not web_devicons_ok then
        return
      end

      local material_icon_ok, material_icon = pcall(require, "nvim-material-icon")
      if not material_icon_ok then
        return
      end

      web_devicons.setup({
        override = material_icon.get_icons(),
      })

      material_icon.setup()
    end,
  }
end

return { init = init }
