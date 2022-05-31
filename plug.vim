set nocompatible
filetype off

let g:gutentags_define_advanced_commands = 1

set rtp+=/opt/homebrew/opt/fzf

call plug#begin()

Plug 'NLKNguyen/papercolor-theme'
Plug 'gelguy/wilder.nvim'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'lambdalisue/nerdfont.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mileszs/ack.vim'
Plug 'ruanyl/vim-gh-line'
Plug 'rust-lang/rust.vim'
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-test/vim-test'

let g:ale_completion_enabled = 1
Plug 'dense-analysis/ale'

call plug#end()

