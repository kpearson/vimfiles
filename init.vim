" Set leader key before loading plugins
let mapleader = "\<Space>"

" Bootstrap lazy.nvim
lua << EOF
-- Set leader key in Lua as well
vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
EOF

" Source all files in ~/.config/nvim/config/plugins/ with a .vim extention

function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.config/nvim/config/' . a:directory . '/*.vim'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

source $HOME/.config/nvim/config/plugins.vimrc
source $HOME/.config/nvim/config/init.vimrc
source $HOME/.config/nvim/config/general.vimrc
source $HOME/.config/nvim/config/mappings.vimrc
call s:SourceConfigFilesIn('plugins')


