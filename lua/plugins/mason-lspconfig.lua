return {
  'neovim/nvim-lspconfig',
  event = "BufReadPre",
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
        "tsserver",
				"html",
				"cssls",
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
		lspconfig.tsserver.setup({
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
		-- vue with ts setting (https://minerva.mamansoft.net/Notes/%F0%9F%93%9Dnvim-lspconfig%E3%81%A7Vue%E3%83%97%E3%83%AD%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%82%92%E9%96%8B%E3%81%84%E3%81%A6%E3%82%82Volar%E3%81%8C%E6%A9%9F%E8%83%BD%E3%81%97%E3%81%AA%E3%81%84)
 --   local lspconfig = lspconfig
 --   require("lspconfig.ui.windows").default_options.border = "single"

 --   local capabilities = require("cmp_nvim_lsp").default_capabilities()
 --   capabilities.textDocument.completion.completionItem.snippetSupport = true

 --   local home = os.getenv("HOME")
 --   local function organize_imports()
 --     local params = {
 --       command = "_typescript.organizeImports",
 --       arguments = { vim.api.nvim_buf_get_name(0) },
 --       title = "",
 --     }
 --     vim.lsp.buf.execute_command(params)
 --   end

 --   lspconfig.volar.setup({
 --     capabilities = capabilities,
 --   })
 --   lspconfig.tsserver.setup({
 --     capabilities = capabilities,
 --     single_file_support = false,
 --     init_options = {
 --       plugins = {
 --         {
 --           name = "@vue/typescript-plugin",
 --           location = home
 --             .. "/.local/share/mise/installs/node/20/lib/node_modules/@vue/language-server",
 --           languages = { "javascript", "typescript", "vue" },
 --         },
 --       },
 --     },
 --     commands = {
 --       OrganizeImports = {
 --         organize_imports,
 --       },
 --     },
 --     filetypes = {
 --       "javascript",
 --       "typescript",
 --       "vue",
 --     },
 --   })
  end,
}
