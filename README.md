# Kit's Vim files

Install [MacVim] via [Homebrew] Cask.  
MacVim requires the full xCode (Command Line Tools is not enough, _sigh_).  
The MacVim binary is essential for [Vundle] and [YouCompleteMe] plugin.

These dotfiles use [Vundle] to manage Vim plugins.

Symlink `vimrc` to the root directory as `.vimrc`. If these vimfiles were
brought in with my [dotfiles](www.github.com/kpearson/dotfiles) install script,
this is already taken care of.

The vimrc file is split up across multiple files in two directories, `rcfiles`
and `rcplugins`. The file are organized by topic and contain specific
binding and setting. See the vim directory [README](/vim/README.md).

## Get Vundle up and running.

Run:

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Launch Vim and run:

```
:PluginInstall
```

## Get YouCompleteMe up and running.

Confirm Cmake was installed via Homebrew.

```
which cmake
```

Should return `/usr/local/bin/cmake`

Then run:

```
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```
