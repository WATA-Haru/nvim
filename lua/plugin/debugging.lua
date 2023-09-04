-- plugins/dap.lua
return {
  -- First, configure `nvim-dap`:
  {
    "mfussenegger/nvim-dap",
    on = { -- Define the events that will load nvim-dap
      "DapContinue", "DapNext", "DapStepIn", -- add any other dap commands you use
    },
    config = function()
      -- fetch the dap plugin
      local dap = require('dap')

      dap.adapters.delve = {
        type = 'server',
        port = '${port}',
        executable = {
          command = 'dlv',
          args = {'dap', '-l', '127.0.0.1:${port}'},
        }
      }

      -- delve configurations
      dap.configurations.go = {
        {
          type = "delve",
          name = "Debug",
          request = "launch",
          program = "${file}"
        },
        {
          type = "delve",
          name = "Debug test", -- configuration for debugging test files
          request = "launch",
          mode = "test",
          program = "${file}"
        },
        -- works with go.mod packages and sub packages 
        {
          type = "delve",
          name = "Debug test (go.mod)",
          request = "launch",
          mode = "test",
          program = "./${relativeFileDirname}"
        }
      }
    end,
  },
  -- Then, configure `dapui`:
  {
    "rcarriga/nvim-dap-ui",
    after = "nvim-dap", -- load after nvim-dap is loaded
    dependencies = {"mfussenegger/nvim-dap"}, -- ensures nvim-dap is loaded first
    config = function()
      local dapui = require('dapui')
      dapui.setup()

      -- Setup DAP UI listeners
      local dap = require('dap')
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}

