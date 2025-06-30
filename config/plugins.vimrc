" _____________________ Plugins ______________________
" ====================================================

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" ________________ Search ________________

Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'

" _________________ Git __________________

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'christoomey/vim-conflicted'
Plug 'mhinz/vim-signify'
" Plug 'peterhurford/send.vim'

" ______________ Utilities _______________

Plug 'itchyny/lightline.vim'
  " Plug 'powerline/powerline-fonts'
Plug 'tomtom/tcomment_vim'
" Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ryanoasis/vim-devicons'
Plug 'editorconfig/editorconfig-vim'

" ______ Auto Completion & Snippets ______

if has('nvim')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'josa42/vim-lightline-coc'
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'justinj/vim-react-snippets'
endif

" ___________ Buffer Fomatting ___________

" Plug 'iCyMind/NeoSolarized' " Colorschemes - Neovim color rendering
Plug 'joshdick/onedark.vim'
Plug 'cocopon/iceberg.vim'
Plug 'aonemd/kuroi.vim'
Plug 'flazz/vim-colorschemes' " All the colors
Plug 'godlygeek/tabular'  " Required for 'vim-markdown'.
Plug 'shime/vim-livedown' " Markdown previewer. Plugin for Livedown
Plug 'sheerun/vim-polyglot'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'prisma/vim-prisma'

" __________ Language Support __________
" ______________________________________

Plug 'evanleck/vim-svelte'

" ________________ Ruby ________________

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
" Plug 'tpope/vim-rake'
Plug 'janko-m/vim-test'
Plug 'keith/rspec.vim'
Plug 'tpope/vim-rbenv'
Plug 'hwartig/vim-seeing-is-believing'
" Plug 'tpope/vim-liquid'

" ________________ Golang ________________

Plug 'fatih/vim-go'

Plug 'https://github.com/alok/notational-fzf-vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end()

