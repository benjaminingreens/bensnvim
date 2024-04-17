-- settings.lua: Basic settings and environment configurations

-- OFNOTE: This is unique to the `work` branch, since I can only access C compilers by downloading them to the local disk. Organisational policies won't allow me to edit system variables, so I have to redirect the config here.
vim.fn.setenv('PATH', 'C:\\mingw64\\bin;' .. vim.fn.getenv 'PATH')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- Neovim UI settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
