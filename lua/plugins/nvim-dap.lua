return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"mxsdev/nvim-dap-vscode-js",
			{
				"microsoft/vscode-js-debug",
				build = "npm install --legacy-peer-deps && npm run compile",
			},
		},

		lazy = true,
		config = function()
			local dap = require("dap")

			require("dap-vscode-js").setup({
				debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
				adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
			})
			for _, language in ipairs({ "typescript", "javascript" , "typescript"}) do
				dap.configurations[language] = {
					{
						--for node
						{
							type = "pwa-node",
							request = "launch",
							name = "Launch file",
							program = "${file}",
							cwd = "${workspaceFolder}",
						},
						{
							type = "pwa-node",
							request = "attach",
							name = "Attach",
							processId = require'dap.utils'.pick_process,
							cwd = "${workspaceFolder}",
						}
					},
					{
						--for jest
						{
							type = "pwa-node",
							request = "launch",
							name = "Debug Jest Tests",
							-- trace = true, -- include debugger info
							runtimeExecutable = "node",
							runtimeArgs = {
								"./node_modules/jest/bin/jest.js",
								"--runInBand",
							},
							rootPath = "${workspaceFolder}",
							cwd = "${workspaceFolder}",
							console = "integratedTerminal",
							internalConsoleOptions = "neverOpen",
						}
					},
					{
						--for mocha
						{
							type = "pwa-node",
							request = "launch",
							name = "Debug Mocha Tests",
							-- trace = true, -- include debugger info
							runtimeExecutable = "node",
							runtimeArgs = {
								"./node_modules/mocha/bin/mocha.js",
							},
							rootPath = "${workspaceFolder}",
							cwd = "${workspaceFolder}",
							console = "integratedTerminal",
							internalConsoleOptions = "neverOpen",
						}
					}
				}
			end
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
			"folke/neodev.nvim"
		},
		config = function()
			require("neodev").setup({
			 library = { plugins = { "nvim-dap-ui" }, types = true },
			})
			require("dapui").setup({
			icons = { expanded = "", collapsed = "" },
			layouts = {
				{
					elements = {
						{ id = "watches", size = 0.20 },
						{ id = "stacks", size = 0.20 },
						{ id = "breakpoints", size = 0.20 },
						{ id = "scopes", size = 0.40 },
					},
					size = 64,
					position = "right",
				},
				{
					elements = {
						"repl",
						"console",
					},
					size = 0.20,
					position = "bottom",
				},
			},
			})
		end,
	}
}
