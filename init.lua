--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require "user.packer"
require "user.default"
require "user.options"
require "user.basic-keymaps"
require "user.nvim-tree"
