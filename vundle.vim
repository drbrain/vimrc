set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
set rtp+=/opt/homebrew/opt/fzf

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'NLKNguyen/papercolor-theme'
Plugin 'godlygeek/tabular'
Plugin 'junegunn/vim-easy-align'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'mileszs/ack.vim'
Plugin 'ruanyl/vim-gh-line'
Plugin 'rust-lang/rust.vim'
Plugin 'takac/vim-hardtime'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-test/vim-test'

let g:ale_completion_enabled = 1
Plugin 'dense-analysis/ale'

call vundle#end()

