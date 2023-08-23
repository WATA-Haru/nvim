-- Plugins
require('plugins')
require('file-explorer')
require('mason-config')
require('code-completion')
require('custom-keys')
require('debugging')
require('styling')
require('file-finder')
require('syntax-highlight')
require('statusbar')
require('file-header-view')

-- automated settings
local function open_nvim_tree()
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- 行番号を表示
vim.opt.number = true

-- ターミナルのタイトルを表示
vim.opt.title = true
-- 文字コードをutf-8に変換
vim.opt.encoding = "utf-8"
-- Tab文字の表示幅（半角スペース4つ分）
--vim.opt.tabstop = 4
-- 不可視文字の可視化（Tabを[^ ]と表示する）
vim.opt.list = false
vim.opt.clipboard = "unnamedplus"
-- ESC to jk
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true })
-- リーダーキーをスペースで設定可能に
vim.g.mapleader = " "
vim.cmd("filetype plugin indent on")
-- spell check
vim.opt.spelllang = 'en_us'
vim.api.nvim_set_keymap('n', '<leader>f', '1z=', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>s', ':set spell!<CR>', { noremap = true })
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

