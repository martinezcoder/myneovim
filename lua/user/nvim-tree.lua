-- NVIM tree setup
require("nvim-tree").setup()
vim.keymap.set('n', '<Leader>n', ":NvimTreeToggle<CR>", { noremap = true })
vim.keymap.set('n', '<Leader>N', ":NvimTreeFindFile<CR>", { noremap = true })
