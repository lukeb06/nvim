require("core.remap.terminal")
require("core.remap.git")
require("core.remap.buffer")

require("utils.vim")

register_keymap("n", "<leader>pv", vim.cmd.Ex, "Project View")

register_keymap("n", "<leader>tt", ":Neotree reveal<CR>", "Tree Toggle")
register_keymap("n", "<leader>pt", ":Neotree reveal<CR>", "Project Tree")

-- ESC Fix
vim.keymap.set("n", "<ESC>", "<NOP>", { noremap = true })

-- EZ Diagnostics
register_keymap("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>", "Diagnostics Float")

-- Save and Quit all buffers
register_keymap("n", "<leader>q", ":wqa<CR>", "Save and Quit")

-- Run Selected SQL Statement
register_keymap("v", "r", '"vy:lua require("dbee").execute(vim.fn.getreg("v"))<CR>', "Run SQL")

-- Horizontal Scrolling ( kitty / ghostty does not have scroll direction locking. )
register_keymap("n", "L", "15zl", "Scroll right")
register_keymap("n", "H", "15zh", "Scroll left")

-- Toggle Wrap
register_keymap("n", "<leader>w", ":set wrap!<CR>", "Toggle Wrap")
