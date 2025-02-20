require("utils.vim")

-- Select All
register_keymap("n", "<leader>bs", "gg_vGg_", "Buffer Select All")
-- Yank All
register_keymap("n", "<leader>by", "magg_vGg_y`a", "Buffer Yank All")
-- Clipboard All
register_keymap("n", "<leader>bc", 'magg_vGg_"+y`a', "Buffer Copy All")
-- Delete All
register_keymap("n", "<leader>bd", "gg_vGg_d", "Buffer Delete All")
-- Format All
register_keymap("n", "<leader>bfa", "magg=G`a", "Buffer Format All")

register_keymap("n", "<leader>br", 'mzviw"+y`z:%s/<C-r><C-w>/<C-r><C-w>/g<Left><Left>', "Buffer Replace Word")
