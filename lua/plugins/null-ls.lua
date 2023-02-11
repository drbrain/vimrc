return {
  "LostNeophyte/null-ls-embedded",

  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "mason.nvim",
    },

    event = { "BufReadPre", "BufNewFile" },

    opts = function()
      local null_ls = require("null-ls")
      return {
        sources = {
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.diagnostics.gitlint,
          null_ls.builtins.diagnostics.hadolint,
          null_ls.builtins.diagnostics.luacheck,
          null_ls.builtins.diagnostics.yamllint,
          null_ls.builtins.diagnostics.zsh,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.jq,
        },
      }
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },

    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "契" },
        topdelete = { text = "契" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- Navigation
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")

        -- Actions
        map({"n", "v"}, "<Leader>hs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({"n", "v"}, "<Leader>hr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<Leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<Leader>hS", gs.stage_buffer, "Stage Buffer")
        map("n", "<Leader>hR", gs.reset_buffer, "Reset Buffer")
        map("n", "<Leader>hp", gs.preview_hunk, "Preview Hunk")
        map("n", "<Leader>hb", function() gs.blame_line({ full=true }) end, "Blame Line")
        map("n", "<Leader>tb", gs.toggle_current_line_blame, "Toggle Blame")
        map("n", "<Leader>hd", gs.diffthis, "Diff This")
        map("n", "<Leader>hD", function() gs.diffthis("~") end, "Diff This ~")
        map("n", "<Leader>td", gs.toggle_deleted, "Toggle Deleted")

        -- Text object
        map({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end
    },
  },
}
