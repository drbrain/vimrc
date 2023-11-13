return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,

    build = ":TSUpdate",

    event = {
      "BufReadPost",
      "BufNewFile",
    },

    opts = {
      auto_install = true,
      context_commentstring = {
        enable = true,
        enable_autocmd = false
      },
      ensure_installed = {
        "c",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "nu",
        "regex",
        "rust",
        "vim",
        "yaml",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      indent = {
        enable = true,
      },
    },

    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      vim.o.foldmethod = "expr"
      vim.o.foldexpr = "nvim_treesitter#foldexpr()"
      vim.o.foldenable = false
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter",

    event = "VeryLazy",

    opts = {
      textobjects = {
        lsp_interop = {
          enable = true,
          border = "single",
          floating_preview_opts = {},
          peek_definition_code = {
            ["<Leader>df"] = { query = "@function.outer", desc = "Show Surrounding Function" },
            ["<Leader>dF"] = { query = "@class.outer",    desc = "Show Surrounding Class" },
          },
        },

        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = { query = "@function.outer", desc = "Next Function Start" },
            ["]]"] = { query = "@class.outer",    desc = "Next Class Start" },
            ["]o"] = { query = "@loop.*",         desc = "Next Loop" },
            ["]s"] = { query = "@scope",          query_group = "locals", desc = "Next Scope" },
            ["]z"] = { query = "@fold",           query_group = "folds",  desc = "Next Fold" },
          },
          goto_next_end = {
            ["]M"] = { query = "@function.outer", desc = "Next Function End" },
            ["]["] = { query = "@class.outer",    desc = "Next Class End" },
            ["]O"] = { query = "@loop.*",         desc = "Next Loop" },
            ["]S"] = { query = "@scope",          query_group = "locals", desc = "Next Scope" },
            ["]Z"] = { query = "@fold",           query_group = "folds",  desc = "Next Fold" },
          },
          goto_previous_start = {
            ["[m"] = { query = "@function.outer", desc = "Prev Function Start" },
            ["[["] = { query = "@class.outer",    desc = "Prev Class Start" },
            goto_previous_end = {
              ["[M"] = { query = "@function.outer", desc = "Prev Function End" },
              ["[]"] = { query = "@class.outer",    desc = "Prev Class End" },
            },
            -- Below will go to either the start or the end, whichever is closer.
            -- Use if you want more granular movements
            -- Make it even more gradual by adding multiple queries and regex.
            goto_next = {
              ["]i"] = { query = "@conditional.outer", desc = "Next Conditional" },
            },
            goto_previous = {
              ["[i"] = { query = "@conditional.outer", desc = "Prev Conditional" },
            }
          },

          select = {
            enable = true,
            lookahead = true,
            include_surrounding_whitespace = false,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = { query = "@function.outer", desc = "Select Around a Function" },
              ["if"] = { query = "@function.inner", desc = "Select Inner Part of a Function" },
              ["ac"] = { query = "@class.outer", desc = "Select Around a Class" },
              ["ic"] = { query = "@class.inner", desc = "Select Inner Part of a Class" },
            },
            selection_modes = {
              ["@parameter.outer"] = "v", -- charwise
              ["@function.outer"] = "V", -- linewise
              ["@class.outer"] = "<c-v>", -- blockwise
            },
          },
        },
      },
    },

    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  }
}
