# Ben's Neovim Config for: `Synology`

`Note`: My current work computer runs on Windows, and I do not have admin rights. This config is installed using PowerShell

## Dependencies

- `git`
- `Node.js`
- `make`
- `unzip`
- C Compiler (like `gcc`)
- Nerd Font

## Actual Installation

### Linux

Git Clone: `git clone -b synology https://github.com/benjaminingreens/bensnvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim`
Path: `$XDG_CONFIG_HOME/nvim`

### Mac

Git Clone: `git clone -b synology https://github.com/benjaminingreens/bensnvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim`
Path: `~/.config/nvim`

### Windows (`cmd`)

Git Clone: `git clone -b synology https://github.com/benjaminingreens/bensnvim.git %userprofile%\AppData\Local\nvim\`
Path: `%userprofile%\AppData\Local\nvim\`

### Windows (`powershell`)

Git Clone: `git clone -b synology https://github.com/benjaminingreens/bensnvim.git $env:USERPROFILE\AppData\Local\nvim\`
Path: `%userprofile%\AppData\Local\nvim\`
