# Kit's Vim files

Install [MacVim] via [Homebrew Cask].
MacVim requires the full xCode (Command Line Tools is not enough, _sigh_).
The MacVim binary is essential for [Vundle] and [YouCompleteMe] plugin.

These dotfiles use [Vundle] to manage Vim plugins.

Symlink `vimrc` to the root directory as `.vimrc`. If these vimfiles were
brought in with my [dotfiles](www.github.com/kpearson/dotfiles) install script,
this is already taken care of.

The vimrc file is split up across multiple files in two directories, `rcfiles`
and `rcplugins`. The file are organized by topic and contain plugin specific
bindings and settings. This way it is easy to know what bindings and settings
are related to a given plugin.

Caveat: This vim setup (lightline plugin) expects the
"PowerlineSymbols-Powerline" font to be available. Download [PowerlineSymbols]
and install into OSX Font Book.

## [Vundle]

Run:

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Launch Vim and run:

```
:PluginInstall
```

## [YouCompleteMe]

Confirm Cmake was installed via Homebrew with:

```
which cmake
```

Should return `/usr/local/bin/cmake`. If not run `brew install cmake`.

Then run:

```
~/.vim/bundle/YouCompleteMe/install.py --clang-completer
```

As referenced in the [YouCompleteMe docs].

[Homebrew]: http://brew.sh/
[Homebrew Cask]: https://github.com/caskroom/homebrew-cask
[MacVim]: https://github.com/b4winckler/macvim
[Vundle]: https://github.com/VundleVim/Vundle.vim
[YouCompleteMe]: https://github.com/Valloric/YouCompleteMe
[YouCompleteMe docs]: https://github.com/Valloric/YouCompleteMe#mac-os-x-installation
[PowerlineSymbols]: https://github.com/powerline/powerline/blob/develop/font/PowerlineSymbols.otf?raw=true

