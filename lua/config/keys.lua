--fetch keyvim.api.nvim_set_keymap
local map = vim.api.nvim_set_keymap

-- update leader key to space
vim.g.mapleader = " "
vim.cmd("filetype plugin indent on")

-- map('n', '<leader>f', '1z=', { noremap = true })
-- map('n', '<leader>s', ':set spell!<CR>', { noremap = true })
-- window resize
map('n', '<leader><', '5<C-W><', { noremap = true })
map('n', '<leader>>', '5<C-W>>', { noremap = true })

-- ESC to jk
map("i", "jk", "<ESC>", { noremap = true })

-- fern
map("n", "<leader>ve", "<cmd>:Fern . -reveal=% -drawer -toggle -width=40<CR>", { noremap = true, silent = true })
map("n", "<leader><leader>v", "", {
  callback = function()
    if vim.bo.filetype == "fern" then
      vim.cmd.wincmd "p"
    else
      vim.cmd.Fern(".", "-reveal=%", "-drawer", "-width=40")
    end
  end,
  noremap = true,
  silent = true,
})

map("n", "<leader>e", "<cmd>:Fern . -reveal=%<CR>", { noremap = true, silent = true })
map("n", "<leader>o", "", {
  callback = function()
    if vim.bo.filetype == "fern" then
      vim.cmd.wincmd "p"
    else
      vim.cmd.Fern(".", "-reveal=%")
    end
  end,
  noremap = true,
  silent = true,
})

-- lspconfig
map('n', '<leader>ls', '<cmd>LspStop<CR>', {noremap = true, silent = true})
map('n', '<leader>la', '<cmd>LspStart<CR>', {noremap = true, silent = true})
map('n', 'K','<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true})

-- bufferline
map('n', 'gt', '<cmd>BufferLineCycleNext<CR>', { noremap = true, silent = true })
map('n', 'gT', '<cmd>BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- telescope
map('n', '<leader>ff', '<cmd>lua require"telescope.builtin".find_files({no_ignore=true, hidden=true})<CR>', {})
map('n', 'gd', '<cmd>lua require"telescope.builtin".lsp_definitions()<CR>', {noremap=true, silent=true})
map('n', 'gr', '<cmd>lua require"telescope.builtin".lsp_references()<CR>', {noremap=true, silent=true})

-- ripgrep files, respects gitignore
--vim.keymap.set('n', '<leader>fg', ':lua require"telescope.builtin".live_grep()<CR>', {})
map('n', '<leader>fg', '<cmd>lua require"telescope.builtin".live_grep()<CR>', {})

-- copilot
function toggle_copilot()
  if vim.g.copilot_enabled then
    vim.cmd('Copilot disable')
    vim.g.copilot_enabled = false
    print("Copilot disabled")
  else
    vim.cmd('Copilot enable')
    vim.g.copilot_enabled = true
    print("Copilot enabled")
  end
end
vim.keymap.set('n', '<leader>cp', toggle_copilot, { noremap = true, silent = true })

map('n', '<F5>', ':DapContinue<CR>', { silent = true })
map('n', '<F10>', ':DapStepOver<CR>', { silent = true })
map('n', '<F11>', ':DapStepInto<CR>', { silent = true })
map('n', '<F12>', ':DapStepOut<CR>', { silent = true })
map('n', '<leader>b', ':DapToggleBreakpoint<CR>', { silent = true })
map('n', '<leader>B', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Breakpoint condition: "))<CR>', { silent = true })
map('n', '<leader>lp', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', { silent = true })
map('n', '<leader>dr', ':lua require("dap").repl.open()<CR>', { silent = true })
map('n', '<leader>dl', ':lua require("dap").run_last()<CR>', { silent = true })
map('n', '<leader>d', ':lua require("dapui").toggle()<CR>', {})
