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
* [RipGrep](https://github.com/BurntSushi/ripgrep#installation): Used to grep file for FZF.  Create the following
  environment variable `export FZF_DEFAULT_COMMAND=rg --files`
