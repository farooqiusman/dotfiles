local Plug = vim.fn['plug#']

-------------
-- PLUGINS --
-------------
vim.call('plug#begin', '~/.vim/plugged')

-- ranger floating window integration
Plug 'kevinhwang91/rnvimr'

-- Comment blocks of code
Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

Plug 'tpope/vim-dispatch'

-- Git greatness
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify' -- Show's git additions/modifications/deletions in number column

-- Telescope
Plug 'nvim-lua/plenary.nvim' -- Dependency for telescope
Plug 'nvim-telescope/telescope.nvim'

-- NVIM LSP STUFF
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-treesitter/nvim-treesitter'

-- PRETTIER
Plug 'MunifTanjim/prettier.nvim' -- Uses null-ls plugin

-- LSP COMPLETION
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-cmdline'

-- Snippets
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

Plug 'mattn/emmet-vim'

-- COLORS
Plug 'gryf/wombat256grf'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'norcalli/nvim-colorizer.lua' -- Fast color highlighter written in lua

-- SYNTAX
Plug 'tikhomirov/vim-glsl'       -- GLSL
Plug 'mboughaba/i3config.vim'    -- i3wm
Plug 'jiangmiao/auto-pairs'

-- Markdown stuff
Plug 'ixru/nvim-markdown'
Plug 'instant-markdown/vim-instant-markdown'

-- Status line
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

vim.call('plug#end')


-- PLUGIN CONFIGURATIONS
require('pluginconf.nvim-treesitter')
require('pluginconf.lsp')
require('pluginconf.cmp')
require('pluginconf.luasnip')
require('pluginconf.null-ls')
require('pluginconf.prettier')
require('pluginconf.comment')
require('pluginconf.lualine')
require('pluginconf.nvim-colorizer')
