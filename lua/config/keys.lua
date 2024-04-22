--fetch keyvim.api.nvim_set_keymap
local map = vim.api.nvim_set_keymap

-- update leader key to space
vim.g.mapleader = " "
vim.cmd("filetype plugin indent on")

-- map('n', '<leader>f', '1z=', { noremap = true })
-- map('n', '<leader>s', ':set spell!<CR>', { noremap = true })
-- window resize
map('n', '<leader><', '5<C-W><', { noremap = true })
map('n', '<leader>>', '5<C-W>>', { noremap = true })

-- ESC to jk
map("i", "jk", "<ESC>", { noremap = true })

-- fern
map("n", "<leader>ve", "<cmd>:Fern . -reveal=% -drawer -toggle -width=40<CR>", { noremap = true, silent = true })
map("n", "<leader><leader>v", "", {
  callback = function()
    if vim.bo.filetype == "fern" then
      vim.cmd.wincmd "p"
    else
      vim.cmd.Fern(".", "-reveal=%", "-drawer", "-width=40")
    end
  end,
  noremap = true,
  silent = true,
})

map("n", "<leader>e", "<cmd>:Fern . -reveal=%<CR>", { noremap = true, silent = true })
map("n", "<leader>o", "", {
  callback = function()
    if vim.bo.filetype == "fern" then
      vim.cmd.wincmd "p"
    else
      vim.cmd.Fern(".", "-reveal=%")
    end
  end,
  noremap = true,
  silent = true,
})

-- lspconfig
vim.keymap.set('n', '<leader>ls', '<CMD>LspStop<CR>')
vim.keymap.set('n', '<leader>la', '<CMD>LspStart<CR>')

-- bufferline
map('n', 'gt', '<Cmd>:BufferLineCycleNext<CR>', { noremap = true, silent = true })
map('n', 'gT', '<Cmd>:BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- telescope
map('n', '<leader>ff', '<cmd>lua require"telescope.builtin".find_files({no_ignore=true, hidden=true})<CR>', {})
map('n', 'gd', '<cmd>lua require"telescope.builtin".lsp_definitions()<CR>', {noremap=true,silent=true})
map('n', 'gr', ':lua require"telescope.builtin".lsp_references()<CR>', {noremap=true,silent=true})

-- ripgrep files, respects gitignore
vim.keymap.set('n', '<leader>fg', ':lua require"telescope.builtin".live_grep()<CR>', {})

