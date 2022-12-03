local function init(use)
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = "plenary.nvim",
    after = "gitsigns.nvim",

    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.code_actions.cspell,
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.diagnostics.cspell.with({
            underline = true,
            virtual_text = false,
            signs = true,
            update_in_insert = false,
            serverity_sort = true,
          }),
          null_ls.builtins.diagnostics.gitlint,
          null_ls.builtins.diagnostics.hadolint,
          null_ls.builtins.diagnostics.luacheck,
          null_ls.builtins.diagnostics.yamllint,
          null_ls.builtins.diagnostics.zsh,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.jq,
        },
      })
    end,

  })

  use {
    "lewis6991/gitsigns.nvim",

    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
          end, {expr=true})

          map("n", "[c", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
          end, {expr=true})

          -- Actions
          map({"n", "v"}, "<leader>hs", ":Gitsigns stage_hunk<CR>")
          map({"n", "v"}, "<leader>hr", ":Gitsigns reset_hunk<CR>")
          map("n", "<leader>hS", gs.stage_buffer)
          map("n", "<leader>hu", gs.undo_stage_hunk)
          map("n", "<leader>hR", gs.reset_buffer)
          map("n", "<leader>hp", gs.preview_hunk)
          map("n", "<leader>hb", function() gs.blame_line{full=true} end)
          map("n", "<leader>tb", gs.toggle_current_line_blame)
          map("n", "<leader>hd", gs.diffthis)
          map("n", "<leader>hD", function() gs.diffthis("~") end)
          map("n", "<leader>td", gs.toggle_deleted)

          -- Text object
          map({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>")
  end
 
      })
    end
  }
end

return { init = init }
