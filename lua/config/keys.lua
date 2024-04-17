--fetch keyvim.api.nvim_set_keymap
local map = vim.api.nvim_set_keymap

-- update leader key to space
vim.g.mapleader = " "
vim.cmd("filetype plugin indent on")

-- map('n', '<leader>f', '1z=', { noremap = true })
-- map('n', '<leader>s', ':set spell!<CR>', { noremap = true })

-- ESC to jk
map("i", "jk", "<ESC>", { noremap = true })

-- map the key n to run the command : NvimTreeToggle
-- vim.api.nvim_set_keymap('n', 'n', [[:NvimTreeToggle<CR>]], {})
--

