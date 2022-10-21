--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require "packer-plugins"

-- This file was originally copy&pasted https://github.com/nvim-lua/kickstart.nvim
-- Then, it was split in the current folder structure
-- The current remaining stuff in this file are concepts that I still need to explore
require "default-init"

require "options"
require "basic-keymaps"

require "plugin-setup.nvim-tree"
require "plugin-setup.telescope"
require "plugin-setup.lualine"
