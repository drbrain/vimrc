let g:gutentags_ctags_executable = system("which ctags")

" Setup gutentags to use rusty-tags
if !exists("g:gutentags_project_info")
  let g:gutentags_project_info = []
endif

call add(g:gutentags_project_info, {'type': 'rust', 'file': 'Cargo.toml'})
