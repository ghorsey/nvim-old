# .vim or vimfiles

My .vim folder setup.

After cloning the repository, `cd .vim` folder and run the following git command:
`git submodule update --init --recursive`

## Windows Terminal
1. Open Windows Terminal Settings
1. Comment out the following lines:

```
// { "command": { "action": "copy", "singleLine": false }, "keys": "ctrl+c" },
// { "command": "paste", "keys": "ctrl+v" },
```

## Dependencies

* [FZF](https://github.com/junegunn/fzf): Used for fuzzy searches
* [RipGrep](https://github.com/BurntSushi/ripgrep#installation): Used to grep file for FZF.

## Setup
* Exclude .gitignore items in fuzzy search: Create the following environment variable `export FZF_DEFAULT_COMMAND=rg --files`
* Install [MinGw](https://sourceforge.net/projects/mingw/) to install GCC
* Install Make on windows `sudo cinst make`

## Share vimrc with NeoVim
* `init.vim` location:
  * Mac/*nix: `~/.config/nvim/init.vim`
  * Windows: `%LOCALAPPDATA%\nvim\init.vim`

```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
```

### Python3 Provider
`pip3 install --user --upgrade neovim`

### Neovim-Remote
`pip3 install --user --upgrade neovim-remote`

## Per-Project Setup

### Projectionist

Projetionist adds commands to open files by type.  To use this extension you need to create a
.projections.json file.  An example file looks like the following:

```
{
  "src/main.js": { "type": "main" },
  "src/data/models/*/model.js": { "type": "model" },
  "src/data/models/*/adapter.js": { "type": "adapter" },
  "src/data/models/*/serializer.js": { "type": "serializer" }
}
```
