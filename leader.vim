let mapleader = ","

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>

  nmap <Leader>ah :Tabularize /=><CR>
  vmap <Leader>ah :Tabularize /=><CR>

  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

