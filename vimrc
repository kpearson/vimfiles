" ==============================================================================
"                                ~My vimrc~
" ==============================================================================
" Author:        Kit Pearson [http://trialanderror.io]
" Source:        https://github.com/kpearson/dotfiles
"
" My vimrc, mostly for rails & javascript development. I have organized
" all of my vimrc style configurations into individual files organized
" by functionality. These live in ~/.vim/rcfiles.
"
" I am using Vundle to manage my plugins, which is configured below
" Each plugin is configured in its own file in ~/.vim/rcplugins
" ------------------------------------------------------------------------------

" Set this before any others
  let mapleader = "\<Space>"

  function! s:SourceConfigFilesIn(directory)
    let directory_splat = '~/.vim/' . a:directory . '/*'
    for config_file in split(glob(directory_splat), '\n')
      if filereadable(config_file)
        execute 'source' config_file
      endif
    endfor
  endfunction

" ========== Plugin Initialization ============

" auto-install vim-plug - Not working!
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" call plug#begin('~/.config/nvim/plugged')
call plug#begin('~/.vim/plugged')
  source ~/.vim/plugins
call plug#end()

filetype plugin indent on
syntax on
colorscheme jellybeans

" Load settings
call s:SourceConfigFilesIn('rcfiles')
call s:SourceConfigFilesIn('pluginSettings')

" ============ Mappings ============
let g:rspec_runner = "os_x_iterm"
" Leader w to write
  nnoremap <Leader>w :w<CR>

" Time between key strokes for combination commands
  set timeoutlen=500

" Set Clipboard to Mirror the Default Register
  set clipboard=unnamed

" Show the current command context in the lower right
  set showcmd

  set makeef=~/##

" Use leader-z to activate spell checker
  nmap <Leader>z :set spell!<CR>

" ============== Markdown ==============

  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  let g:vim_markdown_frontmatter=1  " Frontmatter highlighting
  let g:vim_markdown_folding_disabled=1

" ========== General Settings ==========

" in visual mode, '.' will for each line, go into normal mode and execute the '.'
  vnoremap . :norm.<CR>;
  cmap %/ <C-R>=expand("%:p:h")."/"<CR>
  cmap %% <C-R>=expand("%")<CR>

" vim:ft=vim
