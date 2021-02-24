# Vim files

Author: Kit Pearson

## Quick setup

Assuming you have no current VIM setup. Clone this repo to user root of your
system and run:

```sh
chmod 755 ~/.vim/setup && ~/.vim/setup`
```

## Change log

- Dropping support for Vim. Neovim only.
- Dropping support for the youcompleteme plugin in lue of [COC] (Conquer of Completion)

## Setup

### Install

Install [Neovim] via [Homebrew] `brew install neovim/neovim/neovim`.

> The next couple steps are included in the _setup.sh_ script.

### Link the project

Symlink this project directory to the new Neovim locations.

```shell
mkdir -p "$HOME"/.config
ln -s "$HOME"/.vim "$HOME"/.config/nvim
```

### Italic fonts

Italic fonts in Neovim need a little help.

- Create a file called `256color-italic.terminfo` with the following contents:

  ```sh
  xterm-256color-italic|xterm with 256 colors and italic,
  sitm=\E[3m, ritm=\E[23m,
  use=xterm-256color,
  ```

- Then from the same directory as the new file run:

  ```sh
  tic xterm-256color-italic.terminfo
  ```

- In the `bashrc` or `zshrc` add:

  ```sh
  export TERM=xterm-256color-italic
  ```

- Finally add to the neovim's `~/.config/init/` or symlinked `~/.vimrc`

  ```sh
  set termguicolors
  ```

- If your using iTerm ensure "Italic text allowed" is enabled.

### Completions

Conquer of Completion requires [nodejs] >= 8.10.0

### Snippets

TODO: Not currently working

### Lightline

The lightline plugin expects the "PowerlineSymbols-Powerline" font to be
available. Download [PowerlineSymbols] and install into OSX Font Book.

## Plugin Manager

[Vim-plug] is used to manage plugins.

[Vim-plug] is automatically downloaded the first time NVIM is run if it is not
present in the `autoload` directory. If that happens `Pluginstall` will also
run automatically. Find all logic related to this in _config/plugins.vim_

Run `:PlugStatus` from inside VIM for more info.

## [Reactjs] Vim Setup

### Syntax highlighting

Use [mxw's Vim JSX](https://github.com/mxw/vim-jsx) highlighting.

```vim
Plugin 'mxw/vim-jsx'
```

To get syntax highlighting in a .js file add this to your
Using JSX syntax in .js files requires an additional config.

```vim
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
```

### Syntax checking

I'm using [Syntastic], which requires a little setup out side the scope of
the `.vimrc`.

Install [eslint], [babel-eslint] (for ES6 support), and [eslint-plugin-react]:

```sh
npm install -g eslint

npm install -g babel-eslint

npm install -g eslint-plugin-react
```

Create a config like this in your project's `.eslintrc`, or do so globally by
placing it in ~/.eslintrc:

```json
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
  "plugins": ["react"],
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

```vim
let g:syntastic_javascript_checkers = ['eslint']
```

You should be good to go, and JSX with ES6 features will syntax check correctly!

## To Update

https://yeripratama.com/blog/customizing-coc-explorer/
https://yeripratama.com/blog/customizing-vim-lightline/

Coc configure yaml schema ref: https://www.schemastore.org/json/

[eslint-plugin-react]: https://github.com/yannickcr/eslint-plugin-react
[babel-eslint]: https://github.com/babel/babel-eslint
[eslint]: http://eslint.org/
[syntastic]: https://github.com/vim-syntastic/syntastic
[homebrew]: http://brew.sh/
[homebrew cask]: https://github.com/caskroom/homebrew-cask
[vim-plug]: https://github.com/junegunn/vim-plug
[powerlinesymbols]: https://github.com/powerline/powerline/blob/develop/font/PowerlineSymbols.otf?raw=true
[reactjs]: https://reactjs.org/
[coc]: https://github.com/neoclide/coc.nvim
[conquer of completion]: https://github.com/neoclide/coc.nvim
[nodejs]: https://nodejs.org/en/
