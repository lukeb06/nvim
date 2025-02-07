-- Select All
vim.keymap.set("n", "<leader>bs", "gg_vGg_", { desc = "Buffer Select", silent = true })
-- Yank All
vim.keymap.set("n", "<leader>by", "magg_vGg_y`a", { desc = "Buffer Yank", silent = true })
-- Clipboard All
vim.keymap.set("n", "<leader>bc", 'magg_vGg_"+y`a', { desc = "Buffer Copy", silent = true })
-- Delete All
vim.keymap.set("n", "<leader>bd", "gg_vGg_d", { desc = "Buffer Delete", silent = true })
-- Format All
vim.keymap.set("n", "<leader>bfa", "magg=G`a", { desc = "Buffer Format", silent = true })

-- Switch to last buffer
