" General configurations
" ======================

set hidden                      " Allow buffer change w/o saving
set autoread                    " Load file from disk, ie for git reset
set nocompatible		            " Not concerned with vi compatibility
set lazyredraw                  " Don't update while executing macros
set ttyfast                     " u got a fast terminal
set backspace=indent,eol,start	" Sane backspace behavior
set history=1000  		          " Remember last 1000 commands
set scrolloff=8                 " Keep at least 4 lines below cursor
set expandtab                   " Convert <tab> to spaces (2 or 4)
set tabstop=2                   " Two spaces per tab as default
set shiftwidth=2                "     then override with per filteype
set softtabstop=2               "     specific settings via autocmd
set smarttab
set secure                      " Limit what modelines and autocmds can do
set mouse=a                     " Enable mouse navagation
set number                      " Line numbers
set vb t_vb=                    " Disable sound/visual bell on errors
set modelines=1                 " Allow rcfiles to be recognized as vim file
set timeoutlen=500              " Time between key strokes for combination commands
set clipboard=unnamed           " Clipboard to Mirror the Default Register
set showcmd                     " Show current command in the lower right
set makeef=~/##
set nobackup " ____ I hate swap files in my project dirs ___
set nowritebackup
set noswapfile

" ___________ Persistent undo __________
let undodir = expand('~/.undo-vim')
if !isdirectory(undodir)
  call mkdir(undodir)
endif
set undodir=~/.undo-vim
set undofile " Create FILE.un~ files for persistent undo

" _______ Search Configuration _________
set incsearch   " Highlight while searching
set hlsearch    " Persistent search highlight
set ignorecase  " Case insensitive pattern matching
set smartcase   " Overide ignorecase if pattern contains upcase

if has("nvim")
  set termguicolors " Essential for Neovim to display comments as italic
endif

" Comments to italic - NOT WORKING!
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
" set term=xterm-256color
highlight Comment cterm=italic

" let g:python_host_prog = '/usr/local/bin/python'

function! FormatJson()
  silent! execute '%!python -m json.tool'
endfunction

nnoremap <Leader>k FormatJson()<CR>

" Cursor shape - This converts the cursor into a line while in insert mode.
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Enable cursor shape to change in different modes.
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff500-blinkon175
		  " \,sm:block-blinkwait175-blinkoff150-blinkon175

" ============== Tmux on iTerm2 ==============
" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" ===== Zsh configurations ======
au BufRead,BufNewFile *.zsh-theme set filetype=zsh

command! ReformatCurlRequest silent %s/\s\(-.\{-}\)\s/
 \1 /g

" Move visual selection
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" NeoVim native Live Substitution
set inccommand=split

com! FormatJSON %!python -m json.tool

" vim:ft=vim
