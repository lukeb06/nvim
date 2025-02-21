require("core.remap.terminal")
require("core.remap.git")
require("core.remap.buffer")

local vimtils = require("utils.vim")

vimtils.register_keymap("n", "<leader>pv", vim.cmd.Ex, "Show netrw")

vimtils.register_keymap("n", "<leader>tt", ":Neotree reveal<CR>", "Toggle Neotree")
vim.keymap.set("n", "<leader>pt", ":Neotree reveal<CR>", { desc = "Open Neotree", silent = true })

-- ESC Fix
vim.keymap.set("n", "<ESC>", "<NOP>", { noremap = true })

vimtils.register_keymap("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>", "Diagnostics Float")

vimtils.register_keymap("n", "<leader>q", ":wqa<CR>", "Save and Quit")

vimtils.register_keymap("v", "r", '"vy:lua require("dbee").execute(vim.fn.getreg("v"))<CR>', "Run selected as SQL")

-- Horizontal Scrolling ( kitty / ghostty does not have scroll direction locking. )
vim.keymap.set("n", "L", "15zl")
vim.keymap.set("n", "H", "15zh")

vimtils.register_keymap("n", "<leader>w", ":set wrap!<CR>", "Toggle Wrap")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
