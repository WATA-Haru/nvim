return { 
	'EdenEast/nightfox.nvim',
	lazy = false,
	priority = 1000,
	config = function()
		require('nightfox').setup({
			options = {
    				styles = {
      				comments = "italic",
      				--keywords = "bold",
      				--types = "italic,bold",
				}
			}
		})
		--vim.cmd("colorscheme nightfox")
		vim.cmd("colorscheme nordfox")
	end,
}
