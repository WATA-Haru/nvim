vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'

vim.opt.fileencoding = 'utf-8'
-- set number
vim.opt.number = true

--ref https://zenn.dev/fukakusa_kadoma/articles/4d48fb4e67c945#neovim%E3%81%A7%E6%84%9B%E7%94%A8%E3%81%97%E3%81%A6%E3%81%84%E3%82%8B%E3%83%97%E3%83%A9%E3%82%B0%E3%82%A4%E3%83%B3%E3%81%AE%E8%A7%A3%E8%AA%AC
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.title = true
vim.opt.encoding = "utf-8"
vim.opt.mouse = 'a'
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true
vim.opt.helplang = 'ja', 'en'
vim.opt.updatetime = 300
vim.opt.showtabline = 2
vim.opt.clipboard = 'unnamedplus' --クリップボードとレジスタを共有
vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.swapfile = false --スワップファイルを生成しない
vim.opt.wrap = true --端までコードが届いた際に折り返す

-- show tab as  ^ charcter
vim.opt.list = false
vim.opt.clipboard = "unnamedplus"

-- netrw configurations
vim.g.netrw_liststyle = 3  -- Note: This sets the style to 3, make sure to set it once
vim.g.netrw_sizestyle = "H"
vim.g.netrw_banner = 0
vim.g.netrw_preview = 1
vim.g.netrw_altv = 1
vim.g.netrw_timefmt = "%Y/%m/%d(%a) %H:%M:%S"
vim.g.netrw_winsize = 40
vim.g.netrw_browse_split = 3

-- User specific variables
vim.g.user42 = 'hwatahik'
vim.g.mail42 = 'hwatahik@student.42tokyo.jp'

-- for tender
if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end

-- clipboard
if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = "myClipboard",
		copy = {
			["+"] = "win32yank.exe -i",
			["*"] = "win32yank.exe -i",
		},
		paste = {
			["+"] = "win32yank.exe -o",
			["*"] = "win32yank.exe -o",
		},
		cache_enabled = 1,
	}
end

--if vim.fn.has("wsl") == 1 then
--	if vim.fn.executable("wl-copy") == 0 then
--		print("wl-clipboard not found, clipboard integration won't work")
--	else
--		vim.g.clipboard = {
--			name = "wl-clipboard (wsl)",
--			copy = {
--				["+"] = 'wl-copy --foreground --type text/plain',
--				["*"] = 'wl-copy --foreground --primary --type text/plain',
--			},
--			paste = {
--				["+"] = (function()
--					return vim.fn.systemlist('wl-paste --no-newline|sed -e "s/\r$//"', {''}, 1) -- '1' keeps empty lines
--				end),
--				["*"] = (function() 
--					return vim.fn.systemlist('wl-paste --primary --no-newline|sed -e "s/\r$//"', {''}, 1)
--				end),
--			},
--			cache_enabled = true
--		}
--	end
--end
