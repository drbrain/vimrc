return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,

    build = ":TSUpdate",

    event = {
      "BufReadPost",
      "BufNewFile",
    },

    keys = {
      { "gnn", desc = "Increment selection" },
      { "grm", desc = "Shrink selection", mode = "x" },
    },

    opts = {
      auto_install = true,
      context_commentstring = { enable = true, enable_autocmd = false },
      ensure_installed = {
        "c",
        "help",
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

  -- Disabled due to https://github.com/nvim-treesitter/nvim-treesitter-textobjects/pull/317
  -- {
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   dependencies = "nvim-treesitter",
  --
  --   config = function()
  --     require("nvim-treesitter.configs").setup({
  --       textobjects = {
  --         select = {
  --           enable = true,
  --           lookahead = true,
  --           include_surrounding_whitespace = false,
  --
  --           keymaps = {
  --             -- You can use the capture groups defined in textobjects.scm
  --             ["af"] = { query = "@function.outer", desc = "select around a function" },
  --             ["if"] = { query = "@function.inner", desc = "select inner part of a function" },
  --             ["ac"] = { query = "@class.outer", desc = "select around a class" },
  --             ["ic"] = { query = "@class.inner", desc = "select inner part of a class" },
  --           },
  --           selection_modes = {
  --             ["@parameter.outer"] = "v", -- charwise
  --             ["@function.outer"] = "V", -- linewise
  --             ["@class.outer"] = "<c-v>", -- blockwise
  --           },
  --           move = {
  --             enable = true,
  --             set_jumps = true,
  --             goto_next_start = {
  --               ["]]"] = "@function.outer",
  --               ["]\\"] = "@class.outer",
  --             },
  --             goto_previous_start = {
  --               ["[["] = "@function.outer",
  --               ["[\\"] = "@class.outer",
  --             },
  --           },
  --         },
  --       },
  --     })
  --   end
  -- }
}
