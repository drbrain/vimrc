let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
      \ 'ruby': ['standardrb'],
      \ 'rust': ['analyzer'],
      \}

let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitspace'],
      \ 'ruby': ['standardrb'],
      \ 'rust': ['rustfmt'],
      \}

