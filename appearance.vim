colorscheme drbrain

set number
set relativenumber
set numberwidth=3

set visualbell

set showcmd

set ruler
set laststatus=2
" overridden by airline.vim
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

