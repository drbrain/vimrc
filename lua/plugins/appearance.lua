vim.opt.termguicolors = true

return {
  {
    "NLKNguyen/papercolor-theme",

    lazy = true,
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,

    opts = {
      style = "night",
      on_colors = function(colors)
        colors.bg = "#13151F"
        colors.bg_dark = "#0F1119"
      end
    },

    config = function(_, opts)
      vim.o.background = "dark"

      require("tokyonight").setup(opts)

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
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-material-icon",
      "nvim-web-devicons",
      "tokyonight.nvim",
    },

    event = "VeryLazy",

    opts = {
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
    },
  },

  {
    'huy-hng/anyline.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = 'VeryLazy',
    config = true
  },

  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<Leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Delete all Notifications",
      },
    },

    opts = {
      render = "compact",
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
  },

  {
    "gelguy/wilder.nvim",
    dependencies = {
      "nvim-cmp",
      "nvim-material-icon",
      "nvim-web-devicons",
    },

    event = "VeryLazy",

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
  },

  {
    "norcalli/nvim-colorizer.lua",

    event = {
      "BufNewFile",
      "BufReadPre",
    },

    opts = {
      "*"; -- Highlight all files, but customize some others.
      css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
      html = { names = false; } -- Disable parsing "names" like Blue or Gray
    },
  },

  -- We override this with nvim-material-icon, but need it for compatibility
  {
    "kyazdani42/nvim-web-devicons",

    event = "VeryLazy",
  },

  {
    "DaikyXendo/nvim-material-icon",
    dependencies = "kyazdani42/nvim-web-devicons",

    event = "VeryLazy",

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
}
