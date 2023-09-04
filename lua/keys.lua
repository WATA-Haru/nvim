--fetch keyvim.api.nvim_set_keymap
local map = vim.api.nvim_set_keymap

-- update leader key to space
vim.g.mapleader = " "
vim.cmd("filetype plugin indent on")

map('n', '<leader>f', '1z=', { noremap = true })
map('n', '<leader>s', ':set spell!<CR>', { noremap = true })

-- ESC to jk
map("i", "jk", "<ESC>", { noremap = true })

-- map the key n to run the command : NvimTreeToggle
vim.api.nvim_set_keymap('n', 'n', [[:NvimTreeToggle<CR>]], {})

-- nvim-dap keymappings
-- Press f5 to debug
map('n', '<F5>', [[:lua require'dap'.continue()<CR>]], {})
-- Press CTRL + b to toggle regular breakpoint
map('n', '<C-b>', [[:lua require'dap'.toggle_breakpoint()<CR>]], {})
-- Press CTRL + c to toggle Breakpoint with Condition
map('n', '<C-c>', [[:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>]], {})
-- Press CTRL + l to toggle Logpoint
map('n', '<C-l>', [[:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log Point Msg: '))<CR>]], {})
-- Pressing F10 to step over
map('n', '<F10>', [[:lua require'dap'.step_over()<CR>]], {})
-- Pressing F11 to step into
map('n', '<F11>', [[:lua require'dap'.step_into()<CR>]], {})
-- Pressing F12 to step out
map('n', '<F12>', [[:lua require'dap'.step_out()<CR>]], {})
-- Press F6 to open REPL
map('n', '<F6>', [[:lua require'dap'.repl.open()<CR>]], {})
-- Press dl to run last ran configuration (if you used f5 before it will re run it etc)
map('n', 'dl', [[:lua require'dap'.run_last()<CR>]], {})
-- Press Ctrl+d to toggle debug mode, will remove NvimTree also
map('n', '<C-d>', [[:NvimTreeToggle<CR> :lua require'dapui'.toggle()<CR>]], {})

-- use keymap in file-header-view(bufferline-plugin)
-- bufferline close setting
vim.keymap.set('n', '<leader>wl', '<CMD>BufferLineCloseRight<CR>')
vim.keymap.set('n', '<leader>wh', '<CMD>BufferLineCloseLeft<CR>')
vim.keymap.set('n', '<leader>wall', '<CMD>BufferLineCloseOthers<CR>')
vim.keymap.set('n', '<leader>we', '<CMD>BufferLinePickClose<CR>')

-- (reference)https://github.com/kazhala/dotfiles/blob/master/.config/nvim/lua/kaz/plugins/bufferline.lua
vim.keymap.set('n', '<leader>gb', '<CMD>BufferLinePick<CR>')
vim.keymap.set('n', '<leader>ts', '<CMD>BufferLinePickClose<CR>')
vim.keymap.set('n', '<S-l>', '<CMD>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<S-h>', '<CMD>BufferLineCyclePrev<CR>')
vim.keymap.set('n', ']b', '<CMD>BufferLineMoveNext<CR>')
vim.keymap.set('n', '[b', '<CMD>BufferLineMovePrev<CR>')
vim.keymap.set('n', 'gs', '<CMD>BufferLineSortByDirectory<CR>')

-- terminal setting
-- https://qiita.com/delphinus/items/aea16e82de2145d2a6b7

-- Move into windows(exit terminal insert)
vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-h>', '<Esc><C-w>w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-h>', '<C-\\><C-n><C-w>w', { noremap = true, silent = true })

-- Move into windows (reversed + exit terminal insert)
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>W', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-l>', '<Esc><C-w>W', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-l>', '<C-\\><C-n><C-w>W', { noremap = true, silent = true })

-- Close other windows and maximize current window
vim.api.nvim_set_keymap('n', '<A-o>', '<C-w>o', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-o>', '<Esc><C-w>o', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-o>', '<C-\\><C-n><C-w>o', { noremap = true, silent = true })

-- Move to command mode
--vim.api.nvim_set_keymap('n', '<S-;>', ':', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-;>', '<Esc><C-o>:', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<S-;>', '<C-\\><C-n><C-w>:', { noremap = true, silent = true })

-- Search
vim.api.nvim_set_keymap('n', '<A-/>', '/', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-/>', '<Esc><C-o>/', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-/>', '<C-\\><C-n>/', { noremap = true, silent = true })

--terminal auto insert & teminal under position
-- Define the custom command 'T'
vim.cmd([[command! -nargs=* T split | wincmd j | resize 20 | terminal <args>]])

-- telescope.nvim
-- Search files, even hidden ones
vim.keymap.set('n', '<leader>ff', ':lua require"telescope.builtin".find_files({no_ignore=true, hidden=true})<CR>', {})
-- ripgrep files, respects gitignore
vim.keymap.set('n', '<leader>fg', ':lua require"telescope.builtin".live_grep()<CR>', {})

-- mason-lsp-config
vim.keymap.set('n', '<leader>ls', '<CMD>LspStop<CR>')
vim.keymap.set('n', '<leader>la', '<CMD>LspStart<CR>')

-- Set up the autocommand for entering terminal buffers
--vim.cmd([[
--  augroup TerminalSettings
--    autocmd!
--    autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
--  augroup END
--]])

