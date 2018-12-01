# Kit's Vim files

To bootstrap the setup run: `chmod 755 ~/.vim/setup && ~/.vim/setup`

## Macvim

This set of configurations requires [Macvim].

Several of the libraries used here behave subtely differently when using Macvim.
Also, the MacVim binary is essential for the [YouCompleteMe] plugin.

Unfortunitly MacVim requires all of xCode (Command Line Tools is not enough,
_sigh_).

Install [MacVim] via [Homebrew Cask].

## Neovim

* Install [Neovim] via [Homebrew] `brew install neovim/neovim/neovim`.
* Symlink the `vimrc` and `.vim` directory to the new Neovim locations.
    As mentioned in `:help nvim-from-vim`
    ```shell
    mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
    ln -s ~/.vim $XDG_CONFIG_HOME/nvim
    ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
    ```
* Install the Neovim python packages. (Needed for Neovim to use [YouCompleteMe])
    ```shell
    pip install neovim
    pip3 install neovim
    ```
* Italic fonts in Neovim need a little help.
    * Create a file called `256color-italic.terminfo`
        ```
        xterm-256color-italic|xterm with 256 colors and italic,
        sitm=\E[3m, ritm=\E[23m,
        use=xterm-256color,
        ```
    * Then from the same directory as the new file run:
        ```
        $ tic xterm-256color-italic.terminfo
        ```
    * In the `bashrc` or `zshrc` add:
        ```
        export TERM=xterm-256color-italic
        ```
    * Finally add to the neovim's `~/.config/init/` or symlinked `~/.vimrc`
        ```
        set termguicolors
        ```
    * If your using iTerm confirm "Italic text allowed" is enabled.

## Vimrc

Symlink `vimrc` to the root directory as `.vimrc`.

The vimrc file is split up across multiple files in two directories, `rcfiles`
and `rcplugins`. The file are organized by plugin and contain plugin specific
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

## [Reactjs] Vim Setup

### Syntax highlighting

Use [mxw's Vim JSX](https://github.com/mxw/vim-jsx) highlighting.

```
Plugin 'mxw/vim-jsx'
```

To get syntax highlighting in a .js file add this to your Using JSX syntax  in .js files requires an additional config.

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
[Reactjs]: https://reactjs.org/

