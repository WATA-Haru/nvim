-- set number
vim.opt.number = true

-- if you want to check each space count, you will use under the command
-- :set tabstop? | set shiftwidth? | set softtabstop? 
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- show terminal title
vim.opt.title = true
vim.opt.encoding = "utf-8"

-- show tab as  ^ charcter
vim.opt.list = false
vim.opt.clipboard = "unnamedplus"

-- spell check
--vim.opt.spelllang = 'en_us'
--vim.api.nvim_set_keymap('n', '<leader>f', '1z=', { noremap = true })
--Vim.api.nvim_set_keymap('n', '<leader>s', ':set spell!<CR>', { noremap = true })

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
