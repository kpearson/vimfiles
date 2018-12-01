#!/bin/sh

# Link vimrc
echo "Link vimrc"
ln -s "$HOME"/.vim/vimrc ~/.vimrc

# Set up Neovim as well...
echo "Setup Neovim"
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s "$HOME"/.vim/vimrc .config/nvim/init.vim
ln -s "$HOME"/.vim/ .config/nvim/.vim
ln -s "$HOME"/.vim/autoload/plug.vim .config/nvim/autoload/plug.vim

# Install python3 and set global version via pyenv
pyenv install pypy3.5-6.0.0
pyenv global pypy3.5-6.0.0 && . ~/.zshrc
pip3 install --user neovim

# Setup italic fonts
echo "xterm-256color-italic|xterm with 256 colors and italic,
sitm=\E[3m, ritm=\E[23m,
use=xterm-256color," > 256color-italic.terminfo

tic xterm-256color-italic.terminfo
rm xterm-256color-italic.terminfo

# Fix key map problem in Neovim
# https://github.com/neovim/neovim/issues/2048#issuecomment-78045837
infocmp "$TERM" | sed 's/kbs=^[hH]/kbs=\\177/' > "$TERM".ti
tic "$TERM".ti

