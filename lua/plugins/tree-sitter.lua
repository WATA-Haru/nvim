return {
	'nvim-treesitter/nvim-treesitter',
	run = {':TSUpdate',},
	event = {'BufNewFile', 'BufRead'}, -- Lazy load on buffer read, or use 'FileType' for specific file types
	config = function()
		require'nvim-treesitter.configs'.setup {
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "vue", "typescript","html","css", "rust", "javascript"},
			--ensure_installed = "all",
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		}
	end
}

