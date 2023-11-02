-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- showing the tree of my current buffer from where i open up nvim-tree
vim.g.nvim_tree_respect_buf_cwd = 1

return {
	'nvim-tree/nvim-tree.lua',
	dependencies = {'nvim-tree/nvim-web-devicons'},	
	lazy = false,
	config = function()
		require("nvim-tree").setup({
		sort_by = 'extension',
		update_focused_file = {
			enable = true,
			update_cwd = true,
		},
		view = {
			--width = '20%',
			side = 'right',
			signcolumn = 'no',
		},
		renderer = {
			highlight_git = true,
			highlight_opened_files = 'name',
			icons = {
				glyphs = {
					git = {
						unstaged = '!', renamed = '»',
						untracked = '?', deleted = '✘',
						staged = '✓', unmerged = '', ignored = '◌',
					},
				},
			},
		},

		git = {
			enable = true,
			ignore = false,
		},

		actions = {
			expand_all = {
				max_folder_discovery = 100,
				exclude = { '.git', 'target', 'build' },
			},
		},

		on_attach = 'default'
	})
	end,

	--automated settings
	init = function()
	    require("nvim-tree.api").tree.open()
	end,
}

