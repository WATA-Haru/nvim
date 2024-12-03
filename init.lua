require('config/common-setting')
require('config/keys')
require('config/lazynvim')

-- start up NoNeckPain
vim.api.nvim_create_autocmd({"VimEnter", "TabNew"}, {
	command = "NoNeckPain",
})
