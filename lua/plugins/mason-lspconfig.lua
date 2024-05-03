return {
	'neovim/nvim-lspconfig',
	--lazy = true,
	event = "BufReadPre",
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
		cmd = { "LspInfo", "LspInstall", "LspUninstall" },
		config = function()
			-- Mason LSPConfig のセットアップ
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls",
					"clangd",
					"cmake",
					"dockerls",
					"docker_compose_language_service",
				},
			})
			-- auto lspconfig setting
			require('mason-lspconfig').setup_handlers {
				function(server_name)
					require('lspconfig')[server_name].setup {}
				end,
			}

			-- 新しい設定を追加する
			local cmp_nvim_lsp = require "cmp_nvim_lsp"
			require("lspconfig").clangd.setup {
				capabilities = cmp_nvim_lsp.default_capabilities(),
				cmd = {
					"clangd",
					"--offset-encoding=utf-16", -- 新しい設定を追加
				},
			}
		end
	}
}

