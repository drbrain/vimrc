local Util = require("util")

vim.opt.rtp:append("/opt/homebrew/opt/fzf")

return {
  {
    "nvim-telescope/telescope.nvim",
    version = false,
    dependencies = {
      "plenary.nvim",
      "folke/trouble.nvim",
      "telescope-fzf-native.nvim",
      "xiyaowong/telescope-emoji.nvim",
    },

    cmd = "Telescope",

    keys = {
      { "<Leader>,",       "<Cmd>Telescope buffers show_all_buffers=true<CR>", desc = "Switch Buffer" },
      { "<Leader>/",       Util.telescope("live_grep"),                        desc = "Find in Files (Grep)" },
      { "<Leader>:",       "<Cmd>Telescope command_history<CR>",               desc = "Command History" },
      { "<Leader><space>", Util.telescope("files"),                            desc = "Find Files (root dir)" },
      -- find
      { "<Leader>fF",      Util.telescope("files", { cwd = false }),           desc = "Find Files (cwd)" },
      { "<Leader>fb",      "<Cmd>Telescope buffers<CR>",                       desc = "Buffers" },
      { "<Leader>fe",      "<Cmd>Telescope emoji<CR>",                         desc = "Find Emoji" },
      { "<Leader>ff",      Util.telescope("files"),                            desc = "Find Files (root dir)" },
      { "<Leader>fi",      Util.telescope("lsp_incoming_calls"),               desc = "Incoming Calls" },
      { "<Leader>fo",      Util.telescope("lsp_outgoing_calls"),               desc = "Outgoing Calls" },
      { "<Leader>fr",      "<Cmd>Telescope oldfiles<CR>",                      desc = "Recent" },
      -- git
      { "<Leader>gc",      "<Cmd>Telescope git_commits<CR>",                   desc = "Commits" },
      { "<Leader>gs",      "<Cmd>Telescope git_status<CR>",                    desc = "Status" },
      -- search
      { "<Leader>sC",      "<Cmd>Telescope commands<CR>",                      desc = "Commands" },
      { "<Leader>sG",      Util.telescope("live_grep", { cwd = false }),       desc = "Grep (cwd)" },
      { "<Leader>sH",      "<Cmd>Telescope highlights<CR>",                    desc = "Search Highlight Groups" },
      { "<Leader>sM",      "<Cmd>Telescope man_pages<CR>",                     desc = "Man Pages" },
      { "<Leader>sO",      "<Cmd>Telescope vim_options<CR>",                   desc = "Options" },
      { "<Leader>sW",      Util.telescope("grep_string", { cwd = false }),     desc = "Word (cwd)" },
      { "<Leader>sa",      "<Cmd>Telescope autocommands<CR>",                  desc = "Auto Commands" },
      { "<Leader>sb",      "<Cmd>Telescope current_buffer_fuzzy_find<CR>",     desc = "Buffer" },
      { "<Leader>sc",      "<Cmd>Telescope command_history<CR>",               desc = "Command History" },
      { "<Leader>sd",      "<Cmd>Telescope diagnostics<CR>",                   desc = "Diagnostics" },
      { "<Leader>sg",      Util.telescope("live_grep"),                        desc = "Grep (root dir)" },
      { "<Leader>sh",      "<Cmd>Telescope help_tags<CR>",                     desc = "Help Pages" },
      { "<Leader>sk",      "<Cmd>Telescope keymaps<CR>",                       desc = "Key Maps" },
      { "<Leader>sm",      "<Cmd>Telescope marks<CR>",                         desc = "Jump to Mark" },
      {
        "<Leader>ss",
        Util.telescope("lsp_document_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        desc = "Goto Symbol",
      },
      { "<Leader>sw", Util.telescope("grep_string"),                            desc = "Word (root dir)" },
      { "<Leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },

    opts = {
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          preview_height = 0.7,
          preview_cutoff = 5,
          height = {
            padding = 1,
          },
          width = {
            0.7,
            max = 100,
            min = 75,
          },
        },
        mappings = {
          i = {
            ["<C-t>"] = function(...)
              return require("trouble.sources.telescope").open(...)
            end,
            ["<A-i>"] = function()
              Util.telescope("find_files", { no_ignore = true })()
            end,
            ["<A-h>"] = function()
              Util.telescope("find_files", { hidden = true })()
            end,
            ["<C-Down>"] = function(...)
              return require("telescope.actions").cycle_history_next(...)
            end,
            ["<C-Up>"] = function(...)
              return require("telescope.actions").cycle_history_prev(...)
            end,
          },
          n = {
          },
        },
        prompt_prefix = " ",
        selection_caret = " ",
      }
    },

    config = function(_, opts)
      local telescope = require("telescope")

      telescope.setup(opts)

      telescope.load_extension("emoji")
      telescope.load_extension("fzf")
    end,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    event = "VeryLazy",
  },

}
