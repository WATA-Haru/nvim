--fetch keyvim.api.nvim_set_keymap
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- update leader key to space
vim.g.mapleader = " "
vim.cmd("filetype plugin indent on")

-- map('n', '<leader>f', '1z=', opts)
-- map('n', '<leader>s', ':set spell!<CR>', opts)
-- window resize
map('n', '<leader><', '5<c-w><', opts)
map('n', '<leader>>', '5<c-w>>', opts)

-- ESC to jk
map("i", "jk", "<ESC>", opts)

-- \C を付けた状態で検索開始
map('n', '<Leader>/', '/\\C', opts)
map('n', '<Leader>?', '?\\C', opts)

-- 最後の検索に \C を付け加えた状態で検索し直す
map('n', '<Leader>n', '/<Up>\\C<CR>', opts)
map('n', '<Leader>N', '?<Up>\\C<CR>', opts)

-- Insert mode mapping
map("i", "jk", "<ESC>", opts)

-- Normal mode mappings
map("n", "<S-h>", "^", opts)
map("n", "<S-l>", "$", opts)

-- Visual mode mappings
map("v", "<S-h>", "^", opts)
map("v", "<S-l>", "$", opts)

-- Inc/Dec settings
map("n", "+", "<C-a>", opts)
map("n", "-", "<C-x>", opts)

-- lspconfig
map('n', '<leader>ls', '<cmd>LspStop<CR>', opts)
map('n', '<leader>la', '<cmd>LspStart<CR>', opts)
map('n', 'K','<cmd>lua vim.lsp.buf.hover()<CR>', opts)

-- telescope
map('n', 'gd', '<cmd>lua require"telescope.builtin".lsp_definitions()<CR>', opts)
map('n', 'gr', '<cmd>lua require"telescope.builtin".lsp_references()<CR>', opts)

-- fern
map("n", "<leader>ve", "<cmd>:Fern . -reveal=% -drawer -toggle -width=40<CR>", opts)
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
map("n", "<leader>e", "<cmd>:Fern . -reveal=%<CR>", opts)
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
