set nocompatible
filetype off

let g:gutentags_define_advanced_commands = 1

set rtp+=/opt/homebrew/opt/fzf

call plug#begin()

Plug 'godlygeek/tabular'
Plug 'jinh0/eyeliner.nvim'
Plug 'junegunn/vim-easy-align'
Plug 'nvim-lua/popup.nvim'
Plug 'ruanyl/vim-gh-line'
Plug 'tpope/vim-fugitive'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-test/vim-test'

call plug#end()

