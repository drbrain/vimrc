" highlight trailing whitespace
highlight WhitespaceEOL ctermbg=LightMagenta guibg=LightMagenta
match WhitespaceEOL /\s\+$/

" highlight leading tabs
highlight TabCharacters ctermfg=Yellow cterm=underline
highlight TabCharacters guifg=Yellow gui=underline
2match TabCharacters /^\t\+/

