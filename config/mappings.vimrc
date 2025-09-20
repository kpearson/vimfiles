" _____________________ Mappings _____________________
" ====================================================

let g:rspec_runner = "os_x_iterm"

" __________ Split navagation __________
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" In visual mode, '.' will for each line, go into normal mode and execute
" the '.'
vnoremap . :norm.<CR>;
cmap %/ <C-R>=expand("%:p:h")."/"<CR>
cmap %% <C-R>=expand("%")<CR>

nnoremap <Leader>w :w<CR> " Leader w to write
nmap <leader>h :nohlsearch<cr>  " Turn off search highlight
nmap <Leader>z :set spell!<CR> " Use leader-z to activate spell checker
nmap <Leader>v :so $MYVIMRC<CR>

