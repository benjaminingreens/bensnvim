-- settings.lua: Basic settings and environment configurations

-- OFNOTE: This is unique to the `work` branch, since I can only access C compilers by downloading them to the local disk. Organisational policies won't allow me to edit system variables, so I have to redirect the config here.
vim.fn.setenv('PATH', 'C:\\mingw64\\bin;' .. vim.fn.getenv 'PATH')

-- OFNOTE: This is also unique to the `work` branch, since I cannot add whatever I want to PATH without editing system variables (and I don't have admin rights), so I have to make do with a setup like this
vim.cmd [[let $PATH = $PATH . ';c:\\users\\benhammond\\appdata\\roaming\\python\\python39\\Scripts']]

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
vim.opt.termguicolors = true
-- vim.opt.foldmethod = 'indent'
-- OFNOTE: The above might be removed once I implement a more VSC style fold method

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldcolumn = '1'
function _G.custom_fold_text()
    local line = vim.fn.getline(vim.v.foldstart)
    local num_lines = vim.v.foldend - vim.v.foldstart + 1
    return line .. ' ➤ ' .. num_lines .. ' lines'
end
vim.opt.foldtext = 'v:lua.custom_fold_text()'
