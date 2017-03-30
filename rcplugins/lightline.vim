" ------------------------------------------------------
" Lighline - A light and configurable statusline/tabline
" ------------------------------------------------------

Plug 'itchyny/lightline.vim'

" ========== Status Bar config =========

" Enable status bar
set laststatus=2

let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', ], [ 'fugitive', 'readonly', 'filename' ] ],
  \   'right': [ [ 'syntastic', 'column', 'lineinfo' ], [ 'filetype' ] ]
  \ },
  \ 'component': {
  \   'column': '%c'
  \ },
  \ 'component_function': {
  \   'fugitive': 'MyFugitive',
  \   'readonly': 'MyReadonly',
  \   'lineinfo': 'MyLineInfo'
  \ },
  \ 'component_expand': {
  \   'syntastic': 'SyntasticStatuslineFlag',
  \ },
  \ 'component_type': {
  \   'syntastic': 'error',
  \ },
  \ 'separator': { 'left': '⮀', 'right': '⮂' },
  \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
  \ }

function! MyReadonly()
  if &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists('*fugitive#head')
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! MyLineInfo()
  return '⭡ ' . line('.') . '/' . line('$')
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.rb,*.js,*.css,*.sh call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

" vim:ft=vim
