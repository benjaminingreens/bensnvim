-- autocmds.lua: Auto commands to enhance editing experience

-- Create an augroup for theme-related overrides
local theme_overrides = vim.api.nvim_create_augroup('ThemeOverrides', { clear = true })

-- Ensure the autocmd is registered in an appropriate augroup
vim.api.nvim_create_autocmd('ColorScheme', {
  group = theme_overrides, -- Using your existing augroup for theme overrides
  pattern = '*',
  callback = function()
    -- Using defer function to delay the application slightly after colorscheme load
    vim.defer_fn(function()
      vim.api.nvim_set_hl(0, 'VertSplit', { fg = 'NONE', bg = 'NONE' })
      print 'VertSplit colors set to NONE' -- This print statement helps to confirm execution
    end, 100) -- Delay in milliseconds; adjust if needed
  end,
})

-- Existing autocmd for highlighting yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Existing autocmd for setting nvim-tree transparency
vim.api.nvim_create_autocmd('VimEnter', {
  pattern = '*',
  callback = function()
    vim.cmd [[
            hi NvimTreeNormal guibg=NONE
            hi NvimTreeNormalNC guibg=NONE
        ]]
  end,
})
