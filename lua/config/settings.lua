-- settings.lua: Basic settings and environment configurations
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
