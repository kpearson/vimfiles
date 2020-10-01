" ----------------------------------------------
"  vim-signify - Like gitgutter, but faster
" ----------------------------------------------

if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

" vim:ft=vim
