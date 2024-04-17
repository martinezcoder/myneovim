-- Instructions: https://github.com/neovim/nvim-lspconfig
--
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "plugin-setup.lsp.mason"
require("plugin-setup.lsp.handlers").setup()

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

