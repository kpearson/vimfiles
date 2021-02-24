let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:deoplete#auto_complete_start_length = 1

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" call deoppet#initialize()
" 	call deoppet#custom#option('snippets',
" 	\ map(globpath(&runtimepath, 'neosnippets', 1, 1),
" 	\     "{ 'path': v:val }"))
"
" 	imap <C-k>  <Plug>(deoppet_expand)
" 	imap <C-f>  <Plug>(deoppet_jump_forward)
" 	imap <C-b>  <Plug>(deoppet_jump_backward)
" 	smap <C-f>  <Plug>(deoppet_jump_forward)
" 	smap <C-b>  <Plug>(deoppet_jump_backward)
