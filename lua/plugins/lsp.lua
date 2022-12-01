local function init(use)
  use {
    "neovim/nvim-lspconfig",
    after = "mason-lspconfig.nvim",

    config = function()
      local lspconfig = require("lspconfig")
      -- Because null-ls has spelling enabled I get garbage suggestions:
      -- https://github.com/hrsh7th/cmp-nvim-lsp/issues/20
      --
      -- local lsp_defaults = lspconfig.util.default_config
      --
      -- lsp_defaults.capabilities = vim.tbl_deep_extend(
      --   "force",
      --   lsp_defaults.capabilities,
      --   require("cmp_nvim_lsp").default_capabilities()
      -- )

      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
      end

      local lsp_flags = {
        -- This is the default in Nvim 0.7+
        debounce_text_changes = 150,
      }

      lspconfig["rust_analyzer"].setup {
        -- I could not get `rustup run stable rust-analyzer` to work inside vimr
        -- cmd = { "rustup", "run", "stable", "rust-analyzer" },
        on_attach = on_attach,
        flags = lsp_flags,
        -- Server-specific settings...
        settings = {
          ["rust-analyzer"] = {}
        }
      }
    end,
  }

  use {
    "williamboman/mason.nvim",

    config = function()
      require("mason").setup()
    end,
  }

  use {
    "williamboman/mason-lspconfig.nvim",

    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "rust_analyzer" }
      })
    end,
  }

  use({
    "glepnir/lspsaga.nvim",
    config = function()
      local saga = require("lspsaga")

      saga.init_lsp_saga({
        border_style = "rounded",
        diagnostic_header = { "❌", "⚠️", "ℹ️", "💡" },
        code_action_lightbulb = {
          enable = true,
          sign = false,
          sign_priority = 0,
          virtual_text = true,
        },
        code_action_num_shortcut = true,
        symbol_in_winbar = {
          enable = true,
          in_custom = true,
        }
      })

      local function get_file_name(include_path)
        local file_name = require('lspsaga.symbolwinbar').get_file_name()
        if vim.fn.bufname '%' == '' then return '' end
        if include_path == false then return file_name end
        -- Else if include path: ./lsp/saga.lua -> lsp > saga.lua
        local sep = vim.loop.os_uname().sysname == 'Windows' and '\\' or '/'
        local path_list = vim.split(string.gsub(vim.fn.expand '%:~:.:h', '%%', ''), sep)
        local file_path = ''
        for _, cur in ipairs(path_list) do
          file_path = (cur == '.' or cur == '~') and '' or
          file_path .. cur .. ' ' .. '%#LspSagaWinbarSep#>%*' .. ' %*'
        end
        return file_path .. file_name
      end

      local function config_winbar_or_statusline()
        local exclude = {
          ['terminal'] = true,
          ['toggleterm'] = true,
          ['prompt'] = true,
          ['NvimTree'] = true,
          ['help'] = true,
        } -- Ignore float windows and exclude filetype
        if vim.api.nvim_win_get_config(0).zindex or exclude[vim.bo.filetype] then
          vim.wo.winbar = ''
        else
          local ok, lspsaga = pcall(require, 'lspsaga.symbolwinbar')
          local sym
          if ok then sym = lspsaga.get_symbol_node() end
          local win_val = ''
          win_val = get_file_name(true) -- set to true to include path
          if sym ~= nil then win_val = win_val .. sym end
          vim.wo.winbar = win_val
          -- if work in statusline
          vim.wo.stl = win_val
        end
      end

      local events = { 'BufEnter', 'BufWinEnter', 'CursorMoved' }

      vim.api.nvim_create_autocmd(events, {
        pattern = '*',
        callback = function() config_winbar_or_statusline() end,
      })

      vim.api.nvim_create_autocmd('User', {
        pattern = 'LspsagaUpdateSymbol',
        callback = function() config_winbar_or_statusline() end,
      })
    end,
  })

  use {
    "Maan2003/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()

      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  }

  use {
    "simrat39/symbols-outline.nvim",

    config = function()
      require("symbols-outline").setup({
        auto_close = true,
        symbols = {
          File          = { icon = "" },
          Module        = { icon = "" },
          Namespace     = { icon = "" },
          Package       = { icon = "" },
          Class         = { icon = "𝓒" },
          Method        = { icon = "ƒ" },
          Property      = { icon = "" },
          Field         = { icon = "" },
          Constructor   = { icon = "" },
          Enum          = { icon = "ℰ" },
          Interface     = { icon = "ﰮ" },
          Function      = { icon = "ﬦ" },
          Variable      = { icon = "" },
          Constant      = { icon = "" },
          String        = { icon = "𝓐" },
          Number        = { icon = "#" },
          Boolean       = { icon = "⊨" },
          Array         = { icon = "" },
          Object        = { icon = "⦿" },
          Key           = { icon = "" },
          Null          = { icon = "ﳠ" },
          EnumMember    = { icon = "" },
          Struct        = { icon = "𝓢" },
          Event         = { icon = "" },
          Operator      = { icon = "+" },
          TypeParameter = { icon = "𝙏" }
        }
      })

      vim.keymap.set("n", "<Leader>so", "<Cmd>SymbolsOutline<CR>", options)
    end
  }
end

return { init = init }
