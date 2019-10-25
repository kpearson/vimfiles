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


