" ---------------------------------------
" RSpec - Rspec runner for Vim and MacVim.
" ---------------------------------------

let g:rspec_runner = "os_x_iterm2"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

" vim:ft=vim
