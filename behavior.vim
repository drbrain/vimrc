set nocompatible

set nobackup

set autoread
set autowrite
set hidden

set bs=2

filetype on
filetype indent on
filetype plugin on

syntax on

set shortmess+=c

set wildmode=list:longest

set history=200
set viminfo='100,<1000

if trim(tolower(v:progname)) == "vim"
  set maxmem=10000
  set maxmemtot=50000
endif

" disable netrw
let g:netrw_nogx = 1

" terminal
tnoremap <D-Esc> <C-\><C-n>

" vim-dispatch
"let g:dispatch_compilers = {}
"let g:dispatch_compilers['devly'] = 'minitest'

" rust.vim
let g:rustfmt_autosave = 1


