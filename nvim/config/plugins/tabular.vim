" Tabular - lines up text.

if exists(":Tabularize")
  nmap <Leader>= :Tabularize /=<CR>
  vmap <Leader>= :Tabularize /=<CR>
  nmap <Leader>; :Tabularize /:\zs<CR>
  vmap <Leader>; :Tabularize /:\zs<CR>
endif

" vim:ft=vim
