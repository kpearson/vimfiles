" ========== Status Bar config =========

" Enable status bar
set laststatus=2

let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \ 'active': {
  \   'left': [
  \             [ 'mode' ],
  \             [ 'fugitive', 'readonly' ], ['filename' ]
  \           ],
  \   'right': [
  \              [ 'column', 'lineinfo' ],
  \              [ 'filetype' ]
  \            ]
  \ },
  \ 'component': {
  \   'column': "\uE0A3 " . '%c',
  \ },
  \ 'component_function': {
  \   'fugitive': 'MyFugitive',
  \   'readonly': 'MyReadonly',
  \   'lineinfo': 'MyLineInfo',
  \   'columninfo': 'MyColumnInfo',
  \   'gitbranch': 'FugitiveHead',
  \   'mode': 'LightlineMode'
  \ },
  \ 'separator': { 'left': "\uE0C6", 'right': "\uE0C5" },
	\ 'subseparator': { 'left': "\uE0C4", 'right': "\uE0C7" }
  \ }

" function! LightlineMode() abort
"   let ftmap = {
"               \ 'coc-explorer': 'EXPLORER',
"               \ 'fugitive': 'FUGITIVE'
"               \ }
"   return get(ftmap, &filetype, lightline#mode())
" endfunction

function! MyReadonly()
  if &readonly
    return "\uE0A2"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists('*fugitive#head')
    let _ = fugitive#head()
    return strlen(_) ? "\uE0A0 " ._ : ''
  endif
  return ''
endfunction

function! MyLineInfo()
  return "\uE0A1 " . line('.') . '/' . line('$')
endfunction

function! LightlineMode()
  return (lightline#mode() . ' ' . lightline#coc#errors() . lightline#coc#warnings() . lightline#coc#ok())
endfunction

" register components:
call lightline#coc#register()

" augroup AutoSyntastic
"   autocmd!
"   autocmd BufWritePost *.rb,*.js,*.css,*.sh call s:syntastic()
" augroup END
" function! s:syntastic()
"   SyntasticCheck
"   call lightline#update()
" endfunction

" vim:ft=vim
