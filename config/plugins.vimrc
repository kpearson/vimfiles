" _____________________ Plugins ______________________
" ====================================================

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'neomake/neomake' " Asynchronous job-control
Plug 'w0rp/ale' " Asynchronous Lint Engine
  " Plug 'maximbaz/lightline-ale' " ALE indicator for Lightline

" ________________ Search ________________

Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'

" _________________ Git __________________

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'christoomey/vim-conflicted'
" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
" Plug 'peterhurford/send.vim'

" ______________ Utilities _______________

Plug 'itchyny/lightline.vim'
  Plug 'powerline/powerline-fonts'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
Plug 'bronson/vim-trailing-whitespace'
" Plug 'rizzatti/dash.vim'

" ______ Auto Completion & Snippets ______

if has('nvim')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
  Plug 'honza/vim-snippets'
  Plug 'justinj/vim-react-snippets'

" ___________ Buffer Fomatting ___________

Plug 'iCyMind/NeoSolarized' " Colorschemes - Neovim color rendering
Plug 'joshdick/onedark.vim'
" Plug 'flazz/vim-colorschemes' " All the colors
Plug 'godlygeek/tabular'  " Required for 'vim-markdown'.
Plug 'plasticboy/vim-markdown'
  Plug 'shime/vim-livedown' " Markdown previewer. Plugin for Livedown
" Plug 'tpope/vim-sleuth' " File type based 'shiftwidth' and 'expandtab'
"   Plug 'nathanaelkane/vim-indent-guides'
" Plug 'scrooloose/syntastic'
" Plug 'townk/vim-autoclose'
" Plug 'prabirshrestha/vim-lsp'
"   Plug 'prabirshrestha/async.vim'

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

" ______________ Javascript ______________

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'

" ________________ Golang ________________

Plug 'fatih/vim-go'

call plug#end()

