" ==============================================================================
"                                ~My vimrc~
" ==============================================================================
" Author: Kit Pearson [http://trialanderror.io]
" Source: https://github.com/kpearson/dotfiles
"
" My vimrc, mostly for rails & javascript development. I have organized
" all of my vimrc style configurations into individual files organized
" by functionality. These live in ~/.vim/rcfiles.
"
" I am using Vim-Plug to manage my plugins, which is configured below
" Each plugin is configured in its own file in ~/.vim/rcplugins
" ------------------------------------------------------------------------------

" ============== Markdown ==============

  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  let g:vim_markdown_frontmatter=1  " Frontmatter highlighting
  let g:vim_markdown_folding_disabled=1

" vim:ft=vim
