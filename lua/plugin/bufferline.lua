return{
	'akinsho/bufferline.nvim',
	dependencies = {'nvim-tree/nvim-web-devicons'},
	event = { "BufReadPre", "BufNewFile" },
	version = "*",
	config = function()
		require('bufferline').setup{}
	end,
}

