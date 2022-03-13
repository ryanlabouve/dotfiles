# ryanlabouve/dotfiles

Current Environment
* VSCode
* VIM (deprecated for main workflow, for use on servers)
* Ack
* Bash

## Bootstrapping New Desktop

`./init.sh`

## Manual Steps

// TODO: There will be a lot here added over time. Nowhere near complete
currently.

### VSCode

VIM extension https://github.com/VSCodeVim/Vim

```js
{
    ...
    "vim.useSystemClipboard": true,
}
```

#### On every project

```js
{
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[typescript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  }
}
```

https://marketplace.visualstudio.com/items?itemName=Prisma.prisma

### direnv

https://direnv.net/

### Homebrew

Install [Homebrew](http://brew.sh/)
* ack
* git
* heroku-toolbelt
* hub
* macvim
* node
* openssl
* rbenv
* redis
* ruby-build
* tmux
* watchman

### Ruby

Rbenv and ruby.

### Node

Install NVM (they are angstily enraged by `brew`... so #snowflake)
https://github.com/creationix/nvm

`nvm install 5.1.0`
`nvm use 5.1.0`

`npm install -g ember-cli`
`npm install -g gulp`

## References

https://github.com/mathiasbynens/dotfiles
https://github.com/thoughtbot/dotfiles
https://github.com/webpro/awesome-dotfiles

## Colors

Make sure to set a defualt iterm2 color theme as well
https://github.com/chriskempson/base16-iterm2.git

