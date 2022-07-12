set nocompatible
filetype off

let g:gutentags_define_advanced_commands = 1

set rtp+=/opt/homebrew/opt/fzf

call plug#begin()

Plug 'NLKNguyen/papercolor-theme'
Plug 'LhKipp/nvim-nu', {'do': ':TSInstall nu'}
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
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'junegunn/vim-easy-align'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lambdalisue/nerdfont.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mileszs/ack.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ruanyl/vim-gh-line'
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-test/vim-test'
Plug 'xiyaowong/telescope-emoji.nvim'

call plug#end()

