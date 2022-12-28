-- [[ Setting options ]]
-- See `:help vim.o`

-- `vim.opt` is the same as `vim.o` and the same as `o`

vim.wo.signcolumn = 'yes'

vim.wo.number = true -- Make line numbers default

-- https://www.youtube.com/watch?v=hY5-Q6NxQgY&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&index=2
local options = {
  cursorline = true,
  ignorecase = true,
  showtabline = 2,
  smartindent = true,
  scrolloff = 8,
  hlsearch = true, -- Set highlight on search
  mouse = 'a', -- Enable mouse mode
  breakindent = true, -- Enable break indent
  undofile = true, -- Save undo history
  smartcase = true,
  updatetime = 250, -- Decrease update time
  termguicolors = true, -- Set colorscheme
  completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

--- I was not sure about my favourite colorscheme 
--- therefore, I did a pre-selection and created 
--- a function to randomly select one of them each time.
local schemes = {"onedark", "slate"}
vim.cmd ("colorscheme "..schemes[math.random(1,2)])
-- vim.cmd "colorscheme onedark"
-- vim.cmd "colorscheme slate"



