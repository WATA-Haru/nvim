return{
	'akinsho/bufferline.nvim',
	--dependencies = {'nvim-tree/nvim-web-devicons'},
    dependencies = { 'lambdalisue/nerdfont.vim'},
	event = { "BufReadPre", "BufNewFile" },
	version = "*",
	config = function()
		require('bufferline').setup{}
	end,
}

