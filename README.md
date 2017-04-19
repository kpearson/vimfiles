# Kit's Vim files

## Macvim

Install [MacVim] via [Homebrew Cask].
:heavy_exclamation_mark: MacVim requires the full xCode (Command Line Tools is
not enough, _sigh_). Also, the MacVim binary is essential for the
[YouCompleteMe] plugin.

Symlink `vimrc` to the root directory as `.vimrc`. If these vimfiles were
brought in with my [dotfiles](www.github.com/kpearson/dotfiles) install script,
this is already taken care of.

## Neovim

* Install [Neovim] via [Homebrew] `brew install neovim/neovim/neovim`.
* Symlink the `vimrc` and `.vim` directory to the new Neovim locations.
    As mentioned in `:help nvim-from-vim`, run:
    ```shell
    mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
    ln -s ~/.vim $XDG_CONFIG_HOME/nvim
    ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
    ```
* Install the Neovim python packages. (Needed for Neovim to use [YouCompleteMe])
    ```shell
    pip neovim
    pip3 neovim
    ```

## Vimrc

The vimrc file is split up across multiple files in two directories, `rcfiles`
and `rcplugins`. The file are organized by topic and contain plugin specific
bindings and settings. This way it is easy to know what bindings and settings
are related to a given plugin.

:large_orange_diamond: Caveat: This vim setup (lightline plugin) expects the
"PowerlineSymbols-Powerline" font to be available. Download [PowerlineSymbols]
and install into OSX Font Book.

## Plugins

[Vim-plug] is used to manage plugins.

### Installation

#### Unix

```shell
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

#### Neovim

```shell
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Usage

Launch Vim and run:

```shell
:PlugInstall
```

## [YouCompleteMe]

Confirm Cmake is installed via Homebrew with:

```
which cmake
```

Should return `/usr/local/bin/cmake`. If not run `brew install cmake`.

Then run:

```
~/.vim/plugged/YouCompleteMe/install.py --clang-completer
```

As referenced in the [YouCompleteMe docs].

## [React.js] Vim Setup

A Few tweaks to Vim are neede for a smooth React experience.

### Syntax highlighting

To get the syntax highlighting to look right, use
[mxw's Vim JSX](https://github.com/mxw/vim-jsx) highlighting.

```
Plugin 'mxw/vim-jsx'
```

To use JSX syntax in .js files, you'll find this is my `.vimrc`.

```
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
```

### Syntax checking

I'm using [Syntastic], which requires a little setup out side the scope of
the `.vimrc`.

Install [eslint], [babel-eslint]  (for ES6 support), and [eslint-plugin-react]:

```
npm install -g eslint

npm install -g babel-eslint

npm install -g eslint-plugin-react
```

Create a config like this in your project's `.eslintrc`, or do so globally by
placing it in ~/.eslintrc:

```
{
    "parser": "babel-eslint",
    "env": {
        "browser": true,
        "node": true
    },
    "settings": {
        "ecmascript": 6,
        "jsx": true
    },
    "plugins": [
        "react"
    ],
    "rules": {
        "semi": "error",
        "strict": 0,
        "quotes": 0,
        "no-unused-vars": 0,
        "camelcase": 0,
        "no-underscore-dangle": 0
    }
}
```

Finally, configure [Syntastic] to use ESLint in your `.vimrc`.

```
let g:syntastic_javascript_checkers = ['eslint']
```

You should be good to go, and JSX with ES6 features will syntax check correctly! 

[eslint-plugin-react]: https://github.com/yannickcr/eslint-plugin-react
[babel-eslint]: https://github.com/babel/babel-eslint
[eslint]: http://eslint.org/
[syntastic]: https://github.com/vim-syntastic/syntastic
[Homebrew]: http://brew.sh/
[Homebrew Cask]: https://github.com/caskroom/homebrew-cask
[MacVim]: https://github.com/b4winckler/macvim
[Vim-plug]: https://github.com/junegunn/vim-plug
[YouCompleteMe]: https://github.com/Valloric/YouCompleteMe
[YouCompleteMe docs]: https://github.com/Valloric/YouCompleteMe#mac-os-x-installation
[PowerlineSymbols]: https://github.com/powerline/powerline/blob/develop/font/PowerlineSymbols.otf?raw=true

