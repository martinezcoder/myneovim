-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true

--- I was not sure about my favourite colorscheme 
--- therefore, I did a pre-selection and created 
--- a function to randomly select one of them each time.
local schemes = {"onedark", "desert", "evening", "slate", "gruvbox"}
vim.cmd ("colorscheme "..schemes[math.random(1,5)])
-- vim.cmd "colorscheme onedark"
-- vim.cmd "colorscheme gruvbox"
-- vim.cmd "colorscheme desert"
-- vim.cmd "colorscheme evening"
-- vim.cmd "colorscheme slate"

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
