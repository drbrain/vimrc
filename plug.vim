set nocompatible
filetype off

let g:gutentags_define_advanced_commands = 1

set rtp+=/opt/homebrew/opt/fzf

call plug#begin()

Plug 'Maan2003/lsp_lines.nvim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'LhKipp/nvim-nu', {'do': ':TSInstall nu'}
Plug 'folke/tokyonight.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'folke/trouble.nvim'
Plug 'gelguy/wilder.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'godlygeek/tabular'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'jinh0/eyeliner.nvim'
"Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'junegunn/vim-easy-align'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lambdalisue/nerdfont.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mileszs/ack.vim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'norcalli/nvim-colorizer.lua'
"Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'ruanyl/vim-gh-line'
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'tpope/vim-fugitive'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-test/vim-test'

call plug#end()

