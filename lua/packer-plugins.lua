-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

-- stylua: ignore start
require('packer').startup(function (use)
  -- packer can manage itself
  use 'wbthomason/packer.nvim'                                                         -- Package manager

  use 'tpope/vim-fugitive'                                                             -- Git commands in nvim
  use 'tpope/vim-rhubarb'                                                              -- Fugitive-companion to interact with github
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }            -- Add git related info in the signs columns and popups
  use 'numToStr/Comment.nvim'                                                          -- "gc" to comment visual regions/lines
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }                         -- Highlight, edit, and navigate code
  use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } } -- Additional textobjects for treesitter

  use 'mjlbach/onedark.nvim'                                                           -- Theme inspired by Atom

  -- cmp plugins
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }                    -- Autocompletion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'

  use { 'stevearc/aerial.nvim' }

  -- NOTE: this is commented because it conflicts with the Copilot plugin
  -- snippets
  -- use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }                -- Snippet Engine and Snippet Expansion
  -- use 'rafamadriz/friendly-snippets'

  -- LSP
  use 'neovim/nvim-lspconfig'                                                          -- Collection of configurations for built-in LSP client
  use 'williamboman/mason.nvim'                                                        -- Manage external editor tooling i.e LSP servers
  use 'williamboman/mason-lspconfig.nvim'                                              -- Automatically install language servers to stdpath

  use 'slim-template/vim-slim'

  use 'nvim-lualine/lualine.nvim'                                                      -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim'                                            -- Add indentation guides even on blank lines
  use 'tpope/vim-sleuth'                                                               -- Detect tabstop and shiftwidth automatically
  use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons', } }    -- Nvim folders and files tree

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } } -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 } -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available

  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-rspec",
    },
  }

  use 'simrat39/symbols-outline.nvim' -- A tree like view for symbols in Neovim using the Language Server Protocol

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use { "github/copilot.vim" }

  -- Prettier and dependencies
  -- Warning: Prettier won't be automatically installed by this plugin. You need to have it installed either globally or locally for the project.
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')

  -- Zen mode
  use("folke/zen-mode.nvim")

  if is_bootstrap then
    require('packer').sync()
  end
end)
-- stylua: ignore end


-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})
