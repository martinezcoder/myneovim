-- NVIM tree setup
require("nvim-tree").setup({
  open_on_setup = true,
  open_on_tab = true,
  view = {
    adaptive_size = false
  }
})


vim.keymap.set('n', '<Leader>n', ":NvimTreeToggle<CR>", { noremap = true })
vim.keymap.set('n', '<Leader>++', ":NvimTreeResize +5<CR>", { noremap = true })
vim.keymap.set('n', '<Leader>--', ":NvimTreeResize -5<CR>", { noremap = true })
