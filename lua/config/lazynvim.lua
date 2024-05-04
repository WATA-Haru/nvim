local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

if vim.g.vscode then
	--require("lazy").setup('plugin', opts)
	-- delete or add plugin dir for each environment
	require("lazy").setup({
		{import = '../plugins'},
		{import = '../only-nvim'},
		defaults = {
			lazy = true,
		},
		performance = {
			cache = {
				enabled = true,
			},
		},
	})
else
	--require("lazy").setup('plugin', opts)
	-- delete or add plugin dir for each environment
	require("lazy").setup({
		{import = '../plugins'},
		{import = '../only-nvim'},
		defaults = {
			lazy = true,
		},
		performance = {
			cache = {
				enabled = true,
			},
		},
	})
end
