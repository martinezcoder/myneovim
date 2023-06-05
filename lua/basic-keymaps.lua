-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- [Fran custom]

-- Tabs
vim.keymap.set('n', '<C-e>', ":tabnew<CR>", {})
vim.keymap.set('n', '<C-h>', "gt", {})
vim.keymap.set('n', '<C-c>', ":tabclose<CR>", {})

vim.o.clipboard = 'unnamed'

-- Close certain windows with "q"
vim.api.nvim_create_autocmd("FileType", {
 pattern = {
  "help",
  "startuptime",
  "qf",
  "lspinfo",
  "neotest-output",
  "neotest-attach",
  },
  command = [[nnoremap <buffer><silent> q :close<CR>]],
})
