-- NVIM tree setup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  disable_netrw = true,
  open_on_tab = true,
  view = {
    adaptive_size = false
  }
})

vim.keymap.set('n', '<Leader>n', ":NvimTreeToggle<CR>", { noremap = true })
vim.keymap.set('n', '<Leader>++', ":NvimTreeResize +5<CR>", { noremap = true })
vim.keymap.set('n', '<Leader>--', ":NvimTreeResize -5<CR>", { noremap = true })


local function open_nvim_tree()
  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
