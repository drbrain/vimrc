" colorscheme drbrain

set number
" set relativenumber
set numberwidth=3

set visualbell

set showcmd

set ruler
set laststatus=2
set statusline=%t%(\ [%n%M]%)%(\ %H%R%W%)\ %(%c-%v,\ %l\ of\ %L,\ (%o)\ %P\ 0x%B\ (%b)%)

" syntastic
set statusline+=\ %#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


set showbreak="> "

set diffopt=filler,context:8,foldcolumn:0

"""""""""""""
"  airline  "
"""""""""""""

let g:airline_powerline_fonts = 1
let g:airline_enable_branch = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
set laststatus=2
" powerline symbols
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_branch_prefix = ''
let g:airline_symbols.branch = ''
let g:airline_readonly_symbol = ''
let g:airline_symbols.readonly = ''
let g:airline_linecolumn_prefix = ''
let g:airline_symbols.linenr = ''

