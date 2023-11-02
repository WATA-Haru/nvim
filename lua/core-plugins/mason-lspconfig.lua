return {
	'neovim/nvim-lspconfig',
	lazy = false,
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
		cmd = { "LspInfo", "LspInstall", "LspUninstall" },
		config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
					"lua_ls",
					"bashls",
					"clangd",
					--"clang-format",
					"cmake",
					--"cssls",
					"dockerls",
					"docker_compose_language_service",
					--"gopls",
					--"html",
					"jsonls",
					--"tsserver",
					--"marksman",
					--"nimls",
					"pylsp",
			},
		})
		-- auto lspconfig setting
		require('mason-lspconfig').setup_handlers {
		  function(server_name)
		    require('lspconfig')[server_name].setup {}
		  end,
		}
		end
	}
}
