-- plugins.lua: Manages all plugin configurations
-- Placeholder for plugin setup code (complete with the setup details from your configuration)
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
  -- Plugins and their configuration details go here

  {
    'simrat39/symbols-outline.nvim',
    cmd = 'SymbolsOutline', -- Lazy loads on calling :SymbolsOutline
    config = function()
      local opts = {
        highlight_hovered_item = true,
        show_guides = true,
        auto_preview = false,
        position = 'right',
        relative_width = true,
        width = 25,
        auto_close = false,
        show_numbers = false,
        show_relative_numbers = false,
        show_symbol_details = true,
        preview_bg_highlight = 'Pmenu',
        autofold_depth = nil,
        auto_unfold_hover = true,
        fold_markers = { '', '' },
        wrap = false,
        keymaps = { -- These keymaps can be a string or a table for multiple keys
          close = { '<Esc>', 'q' },
          goto_location = '<Cr>',
          focus_location = 'o',
          hover_symbol = '<C-space>',
          toggle_preview = 'K',
          rename_symbol = 'r',
          code_actions = 'a',
          fold = 'h',
          unfold = 'l',
          fold_all = 'W',
          unfold_all = 'E',
          fold_reset = 'R',
        },
        lsp_blacklist = {},
        symbol_blacklist = {},
        symbols = {
          File = { icon = '', hl = '@text.uri' },
          Module = { icon = '', hl = '@namespace' },
          Namespace = { icon = '', hl = '@namespace' },
          Package = { icon = '', hl = '@namespace' },
          Class = { icon = '𝓒', hl = '@type' },
          Method = { icon = 'ƒ', hl = '@method' },
          Property = { icon = '', hl = '@method' },
          Field = { icon = '', hl = '@field' },
          Constructor = { icon = '', hl = '@constructor' },
          Enum = { icon = 'ℰ', hl = '@type' },
          Interface = { icon = 'ﰮ', hl = '@type' },
          Function = { icon = 'f', hl = '@function' },
          Variable = { icon = '', hl = '@constant' },
          Constant = { icon = '', hl = '@constant' },
          String = { icon = '𝓐', hl = '@string' },
          Number = { icon = '#', hl = '@number' },
          Boolean = { icon = '⊨', hl = '@boolean' },
          Array = { icon = '', hl = '@constant' },
          Object = { icon = '⦿', hl = '@type' },
          Key = { icon = '🔐', hl = '@type' },
          Null = { icon = 'NULL', hl = '@type' },
          EnumMember = { icon = '', hl = '@field' },
          Struct = { icon = '𝓢', hl = '@type' },
          Event = { icon = '🗲', hl = '@type' },
          Operator = { icon = '+', hl = '@operator' },
          TypeParameter = { icon = '𝙏', hl = '@parameter' },
          Component = { icon = '', hl = '@function' },
          Fragment = { icon = '', hl = '@constant' },
        },
      }

      require('symbols-outline').setup(opts)
      -- Key mapping to toggle Symbols Outline
      vim.api.nvim_set_keymap('n', '<leader>o', ':SymbolsOutline<CR>', { noremap = true, silent = true })
    end,
  },
  {
    'hanschen/vim-ipython-cell', -- replace this if you find a better-suited plugin
    config = function()
      -- You can add any plugin-specific configurations here
      vim.api.nvim_set_keymap('n', '<C-Enter>', '<Plug>(IPy-Run)', { noremap = false })
      vim.api.nvim_set_keymap('n', '<S-Enter>', '<Plug>(IPy-RunNext)', { noremap = false })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() -- This uses an inline config in `use` to immediately set up the plugin
      require('nvim-treesitter.configs').setup {
        ensure_installed = 'all', -- or a list of languages
        highlight = {
          enable = true, -- enable highlighting
        },
        -- Add more Tree-sitter modules here
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()  -- This uses an inline config in `use` to immediately set up the plugin
        require('nvim-treesitter.configs').setup {
            ensure_installed = "all", -- or a list of languages
            highlight = {
                enable = true, -- enable highlighting
            },
            -- Add more Tree-sitter modules here
        }
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }, -- for file icons, optional
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto', -- automatically picks the theme based on your colorscheme
          component_separators = { left = '', right = '' }, -- chevrons as component separators
          section_separators = { left = '', right = '' }, -- chevrons as section separators
          disabled_filetypes = {},
          globalstatus = true,
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { { 'filename', file_status = true, path = 1 } },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      }
    end,
  },
  {
    'ojroques/vim-oscyank',
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>c', '<Plug>OSCYankOperator', { noremap = true })
      vim.api.nvim_set_keymap('n', '<leader>cc', '<leader>c_', { noremap = true })
      vim.api.nvim_set_keymap('v', '<leader>c', '<Plug>OSCYankVisual', { noremap = true })
    end,
  },
  {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup {
        disable_netrw = true,
        hijack_netrw = true,
        auto_reload_on_write = true,
        hijack_cursor = true,
        update_focused_file = { enable = true, update_root = false },
        diagnostics = { enable = false, debounce_delay = 50, icons = { hint = '', info = '', warning = '', error = '' } },
        filters = { dotfiles = false, custom = {}, exclude = {} },
        git = { enable = true, ignore = true, timeout = 500 },
        view = { width = 25, side = 'left', preserve_window_proportions = false, number = false, relativenumber = false, signcolumn = 'yes' },
        renderer = {
          highlight_git = true,
          highlight_opened_files = 'icon',
          root_folder_modifier = ':~',
          indent_markers = { enable = true },
          icons = { git_placement = 'before', show = { file = true, folder = true, folder_arrow = true, git = true } },
        },
        actions = { change_dir = { enable = true, global = false }, open_file = { quit_on_open = false } },
        trash = { cmd = 'trash', require_confirm = true },
      }
      vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>f', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>F', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
    end,
  },
  'tpope/vim-sleuth',
  {
    'numToStr/Comment.nvim',
    opts = {},
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = { signs = { add = { text = '+' }, change = { text = '~' }, delete = { text = '_' }, topdelete = { text = '‾' }, changedelete = { text = '~' } } },
  },
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      require('which-key').setup()
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      }
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('telescope').setup {
        extensions = { ['ui-select'] = { require('telescope.themes').get_dropdown() } },
      }
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      -- Setup Mason to manage LSP installations
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { "pyright" } -- Automatically install Pyright
      })

      -- Configure Pyright for Python
      require('lspconfig')['pyright'].setup{
        on_attach = function(client, bufnr)
          -- Function to simplify key mapping
          local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

          -- Key mappings for LSP functionality
          local opts = { noremap=true, silent=true }
          buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
          buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
          buf_set_keymap('n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
          buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
          buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
          buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
          buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
          buf_set_keymap('n', '<leader>ds', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
          buf_set_keymap('n', '<leader>ws', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)

          -- Highlight symbol under cursor
          if client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, { buffer = bufnr, callback = vim.lsp.buf.document_highlight })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, { buffer = bufnr, callback = vim.lsp.buf.clear_references })
          end
        end,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic" -- or "off", "strict"
            }
          }
        }
      }

      -- Add your other language servers here in similar blocks
      -- Example: Setup for another language
      -- require('lspconfig')['other_language_server'].setup{...}
    end,
  },
  {
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        return { timeout_ms = 500, lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype] }
      end,
      formatters_by_ft = { lua = { 'stylua' } },
    },
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        build = function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end,
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}
      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },
        mapping = cmp.mapping.preset.insert {
          ['<Tab>'] = cmp.mapping.select_next_item(),
          -- OFNOTE: Can't get the below to work
          -- ['<C-Tab>'] = cmp.mapping.select_prev_item(),
          -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<CR>'] = cmp.mapping.confirm { select = true },
          -- ['<C-Space>'] = cmp.mapping.complete {},
          ['<C-l>'] = function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end,
          ['<C-h>'] = function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end,
        },
        sources = { { name = 'nvim_lsp' }, { name = 'luasnip' }, { name = 'path' } },
      }
    end,
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      -- Configure the TokyoNight theme with transparency and apply it
      require('tokyonight').setup {
        style = 'night', -- setting it to 'night' as per the initial setup; adjust as needed
        transparent = true, -- enabling transparency
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = 'dark',
          floats = 'dark',
        },
        sidebars = { 'qf', 'help' },
        day_brightness = 0.3,
        hide_inactive_statusline = false,
        dim_inactive = false,
        lualine_bold = false,
      }
      -- Load the colorscheme
      vim.cmd.colorscheme 'tokyonight'
      -- Optionally adjust specific highlight groups
      vim.cmd [[hi Comment gui=none]]
    end,
  },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup {
        n_lines = 500
      }
      require('mini.surround').setup()
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'c', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' },
      auto_install = true,
      highlight = { enable = true, additional_vim_regex_highlighting = { 'ruby' } },
      indent = { enable = true, disable = { 'ruby' } },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
