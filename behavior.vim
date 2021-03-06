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

set completeopt=menuone,noinsert,noselect
set shortmess+=c

set foldmethod=syntax

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

" use ag with ack plugin
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
nnoremap <Leader>a :Ack!<Space>

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vim-dispatch
"let g:dispatch_compilers = {}
"let g:dispatch_compilers['devly'] = 'minitest'

" vim-test
"let test#custom_runners = {'Ruby': ['Devly']}
"let test#strategy = "dispatch"

"let g:test#runner_commands = ["Devly", "Minitest"]

" rust.vim
let g:rustfmt_autosave = 1


