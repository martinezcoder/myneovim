--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require "packer-plugins"

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer-plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- This file was originally copy&pasted https://github.com/nvim-lua/kickstart.nvim
-- Then, it was split in the current folder structure
-- The current remaining stuff in this file are concepts that I still need to explore
require "default-init"

require "options"
require "basic-keymaps"

require'nvim-treesitter.install'.compilers = { "clang" }

require "plugin-setup.nvim-tree"
require "plugin-setup.telescope"
require "plugin-setup.lualine"
require "plugin-setup.neotest"
require "plugin-setup.treesitter"
require "plugin-setup.lsp"
require "plugin-setup.cmp"
require "plugin-setup.aerial"
require "plugin-setup.terminal"


