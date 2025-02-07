require("core.remap.terminal")
require("core.remap.git")
require("core.remap.buffer")
require("core.remap.history")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Project View", silent = true })

-- Tree Toggle
-- vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeFindFileToggle, { desc = "Tree Toggle", silent = true })
-- vim.keymap.set("n", "<leader>pt", vim.cmd.NvimTreeFindFileToggle, { desc = "Tree Toggle", silent = true })
--
vim.keymap.set("n", "<leader>tt", ":Neotree reveal<CR>", { desc = "Show Tree", silent = true })
vim.keymap.set("n", "<leader>pt", ":Neotree reveal<CR>", { desc = "Project Tree", silent = true })

-- ESC Fix
vim.keymap.set("n", "<ESC>", "<NOP>", { noremap = true })

-- EZ Diagnostics
vim.keymap.set("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>", { desc = "Diagnostics Float", silent = true })

-- Save and Quit all buffers
vim.keymap.set("n", "<leader>q", ":wqa<CR>", { desc = "Save and Quit", silent = true })

-- Run Selected SQL Statement
vim.keymap.set("v", "r", '"vy:lua require("dbee").execute(vim.fn.getreg("v"))<CR>', { desc = "Run SQL", silent = true })

-- Horizontal Scrolling ( kitty / ghostty does not have scroll direction locking. )
vim.keymap.set("n", "L", "15zl", { desc = "Scroll right", silent = true })
vim.keymap.set("n", "H", "15zh", { desc = "Scroll left", silent = true })

-- Toggle Wrap
vim.keymap.set("n", "<leader>w", ":set wrap!<CR>", { desc = "Toggle Wrap", silent = true })
