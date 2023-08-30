require('common-setting')
require('keys')
require('lazynvim')

-- plugins
--require('plugins')
--require('mason-config')
--require('file-explorer')
--require('file-finder')
--require('file-header-view')
--require('code-completion')
--require('debugging')
--require('styling')
--require('syntax-highlight')
--require('statusbar')
--require('commentout')
--require('night-fox')

-- vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true })

-- leader key to space
-- vim.g.mapleader = " "
-- vim.cmd("filetype plugin indent on")

-- spell check
--vim.opt.spelllang = 'en_us'
--vim.api.nvim_set_keymap('n', '<leader>f', '1z=', { noremap = true })
--vim.api.nvim_set_keymap('n', '<leader>s', ':set spell!<CR>', { noremap = true })

-- windows wsl only settings 
-- but if you write if vim.fn.has("win64") == 1 then , system cant use clipboard.
if vim.fn.has('wsl') == 1 then
  vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlF"
    },
  paste = {
    ["+"] = "win32yank.exe -o --crlf",
    ["*"] = "win32yank.exe -o --crlf"
    },
  cache_enable = 0,
  }
end

-- recognize python3_host_prog to pass checkhealth
vim.g.python3_host_prog = '/usr/bin/python3'
