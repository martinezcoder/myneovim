require("neotest").setup({
  adapters = {
    require("neotest-rspec")
  },
})

function _G.handle_ce_left()
  vim.api.nvim_feedkeys("<", "n", true)
end

function _G.handle_ce_right()
  vim.api.nvim_input(">")
end

local map = vim.api.nvim_set_keymap
local options = { noremap = true }
map('n', '<Leader>T', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', options)
map('n', '<Leader>tt', ':lua require("neotest").run.run()<CR>', options)
map('n', '<Leader>to', ':lua require("neotest").output.open()<CR>', options)
map('n', '<Leader>ta', ':lua require("neotest").run.attach()<CR>', options)
map('n', '<Leader>ts', ':lua require("neotest").summary.open()<CR>', options)

map('i', 'çç', [[<Esc>:lua handle_ce_right()<CR>a]], options)
map('i', 'ññ', [[<Esc>:lua handle_ce_left()<CR>a]], options)
