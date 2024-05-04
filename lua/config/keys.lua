local map = vim.api.nvim_set_keymap

if vim.g.vscode then
    -- VSCode extension
	-- https://github.com/vscode-neovim/vscode-neovim
	map("i", "jk", "<ESC>", { noremap = true })
else
	-- Neovim Ordinary settings
	vim.g.mapleader = " "
	vim.cmd("filetype plugin indent on")
	-- map('n', '<leader>f', '1z=', { noremap = true })
	-- map('n', '<leader>s', ':set spell!<CR>', { noremap = true })
	-- window resize
	map('n', '<leader><', '5<c-w><', { noremap = true })
	map('n', '<leader>>', '5<c-w>>', { noremap = true })
	
	-- ESC to jk
	map("i", "jk", "<ESC>", { noremap = true })
	
	-- \C を付けた状態で検索開始
	vim.api.nvim_set_keymap('n', '<Leader>/', '/\\C', { noremap = true })
	vim.api.nvim_set_keymap('n', '<Leader>?', '?\\C', { noremap = true })
	
	-- 最後の検索に \C を付け加えた状態で検索し直す
	vim.api.nvim_set_keymap('n', '<Leader>n', '/<Up>\\C<CR>', { noremap = true })
	vim.api.nvim_set_keymap('n', '<Leader>N', '?<Up>\\C<CR>', { noremap = true })
	
	-- lspconfig
	map('n', '<leader>ls', '<cmd>LspStop<CR>', {noremap = true, silent = true})
	map('n', '<leader>la', '<cmd>LspStart<CR>', {noremap = true, silent = true})
	map('n', 'K','<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true})
	
	-- telescope
	map('n', 'gd', '<cmd>lua require"telescope.builtin".lsp_definitions()<CR>', {noremap=true, silent=true})
	map('n', 'gr', '<cmd>lua require"telescope.builtin".lsp_references()<CR>', {noremap=true, silent=true})
	
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
end
