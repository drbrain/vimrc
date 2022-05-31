let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_rust_analyzer_executable = '/Users/erichodel/bin/rust-analyzer'

let g:ale_sign_error = '⸭⸭'
let g:ale_sign_warning = ' ⁂'

let g:ale_linters = {
      \ 'ruby': ['standardrb'],
      \ 'rust': ['analyzer'],
      \}

let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'ruby': ['standardrb'],
      \ 'rust': ['rustfmt'],
      \}

