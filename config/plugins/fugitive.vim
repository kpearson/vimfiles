nmap <LEADER>st :call <sid>SaveSessionAndShowGitStatus()<cr>
nmap <LEADER>ST :call <sid>RestoreSession()<cr>
nmap <LEADER>gd :Gdiff<cr>
nmap <LEADER>gb :Gblame<CR>

function! s:SaveSessionAndShowGitStatus()
  let session_name = split(getcwd(), "/")[-1]
  execute "silent! mksession! ~/.vim/sessions/" . session_name
  silent tabonly | silent only | Gstatus
endfunction

function! s:RestoreSession()
  let session_name = split(getcwd(), "/")[-1]
  execute "source ~/.vim/sessions/" . session_name
endfunction

set diffopt+=vertical

command! GitDiff call s:GitDiff()
autocmd FileType gitcommit setl spell
autocmd FileType gitcommit setl diffopt+=vertical
autocmd FileType gitcommit nmap <buffer> <S-Tab> <C-p>
autocmd FileType gitcommit nmap <buffer> <Tab> <C-n>
autocmd BufRead,BufNewFile */.git/COMMIT_EDITMSG wincmd _

" Config for fugitive-gitlab extention
let g:fugitive_gitlab_domains = ['https://my.gitlab.com', 'https://code.cyndx.io']

" vim:ft=vim
