set nocompatible
filetype off

let g:gutentags_define_advanced_commands = 1

set rtp+=/opt/homebrew/opt/fzf

call plug#begin()

Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'ruanyl/vim-gh-line'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-test/vim-test'

call plug#end()

