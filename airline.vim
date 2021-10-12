let g:airline_powerline_fonts = 0
let g:airline_enable_branch = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

let g:airline_detect_spell = 0

let g:airline_section_z = '%#__accent_bold#%{g:airline_symbols.linenr}%#__restore__#%l/%L %#__accent_bold#%{g:airline_symbols.colnr}%#__restore__#%v %#__accent_bold#%{g:airline_symbols.charpos}%#__restore__#%o 0x%B'

" powerline symbols
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_branch_prefix = ''
let g:airline_symbols.branch = ''
let g:airline_readonly_symbol = ''
let g:airline_symbols.colnr = '℅'
let g:airline_symbols.charpos = '¢'
let g:airline_symbols.readonly = ''
let g:airline_linecolumn_prefix = ''
let g:airline_symbols.linenr = ''


