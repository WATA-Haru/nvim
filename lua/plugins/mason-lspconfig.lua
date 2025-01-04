return {
  'neovim/nvim-lspconfig',
  event = {"BufReadPre", "BufNewFile"},
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'williamboman/mason.nvim',
  },
  config = function()
		local lspconfig = require("lspconfig")

    -- Mason must be set up before lspconfig
    require("mason").setup()

    -- Mason LSPConfig setup
    require("mason-lspconfig").setup({
      ensure_installed = {
				"vimls",
				"lua_ls",
        "bashls",
        "clangd",
        "cmake",
        "dockerls",
        "docker_compose_language_service",
        "rust_analyzer",
        "volar",
        --"tsserver",
        "ts_ls",
				"html",
				"cssls",
				"hls",
				"pylsp",
      },
    })

    -- Auto LSPConfig setting
    require('mason-lspconfig').setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {}
      end,
    }

    -- Additional settings
    local cmp_nvim_lsp = require "cmp_nvim_lsp"
    lspconfig.clangd.setup {
      capabilities = cmp_nvim_lsp.default_capabilities(),
      cmd = {
        "clangd",
        "--offset-encoding=utf-16",
      },
    }
    lspconfig.rust_analyzer.setup {
      settings = {
        ['rust-analyzer'] = {
          check = {
            command = "clippy",
          },
        },
      },
    }

		local vue_typescript_plugin = require("mason-registry").get_package("vue-language-server"):get_install_path() .. "/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin"
		lspconfig.ts_ls.setup({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
			},
			root_dir = lspconfig.util.root_pattern({ "package.json", "node_modules" }),
			init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = vue_typescript_plugin,
						languages = { "javascript", "typescript", "vue" },
					},
				},
			},
		})
		lspconfig.volar.setup({})
  end,
}
