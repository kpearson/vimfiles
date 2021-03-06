" set vim to support 256 color terminal
let &t_Co=256

syntax enable
syntax on
filetype plugin indent on

highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(120,999),",")
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
" let &colorcolumn=join(range(81,999),",")

" colorscheme monokai-chris
" colorscheme onedark
" colorscheme iceberg
colorscheme kuroi

" Change colorsheme based on time of day
" if strftime("%H") < 13
"   colorscheme spacegray "southwest-fog "lightning
" else
"   set background=dark
"   colorscheme jellybeans
" endif

" vim:ft=vim
