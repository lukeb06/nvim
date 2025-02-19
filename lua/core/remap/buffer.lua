require("utils.vim")

-- Select All
register_keymap("n", "<leader>bs", "gg_vGg_", "Buffer Select")
-- Yank All
register_keymap("n", "<leader>by", "magg_vGg_y`a", "Buffer Yank")
-- Clipboard All
register_keymap("n", "<leader>bc", 'magg_vGg_"+y`a', "Buffer Copy")
-- Delete All
register_keymap("n", "<leader>bd", "gg_vGg_d", "Buffer Delete")
-- Format All
register_keymap("n", "<leader>bfa", "magg=G`a", "Buffer Format")
