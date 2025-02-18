require("config.lazy")
require("core")

if vim.fn.filereadable(".source.lua") == 1 and vim.fn.argc(-1) == 0 then
	vim.cmd(":source .source.lua")
end

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.scrolloff = 12

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.termguicolors = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.updatetime = 50

vim.opt.showmode = false

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.opt.foldtext = ""

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

vim.opt.foldnestmax = 3

vim.opt.mousescroll = "hor:0"
