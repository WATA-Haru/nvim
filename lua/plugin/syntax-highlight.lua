return {
	'nvim-treesitter/nvim-treesitter',
	run = {':TSUpdate',},
	event = {'BufRead'}, -- Lazy load on buffer read, or use 'FileType' for specific file types
	config = function()
		require'nvim-treesitter.configs'.setup {
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = 'all',
		}
	end
}

