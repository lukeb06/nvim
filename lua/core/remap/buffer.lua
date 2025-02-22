local vimtils = require("utils.vim")

-- Select All
vimtils.register_keymap("n", "<leader>bs", "gg_vGg_", "Buffer Select All")
-- Yank All
vimtils.register_keymap("n", "<leader>by", "magg_vGg_y`a", "Buffer Yank All")
-- Clipboard All
vimtils.register_keymap("n", "<leader>bc", 'magg_vGg_"+y`a', "Buffer Copy All")
-- Delete All
vimtils.register_keymap("n", "<leader>bd", "gg_vGg_d", "Buffer Delete All")
-- Format All
vimtils.register_keymap("n", "<leader>bfa", "magg=G`a", "Buffer Format All")

vimtils.register_keymap("n", "<leader>br", 'mzviw"+y`z:%s/<C-r><C-w>/<C-r><C-w>/g<Left><Left>', "Buffer Replace Word")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
