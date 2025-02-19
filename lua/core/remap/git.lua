require("utils.vim")

register_keymap("n", "<leader>gs", vim.cmd.Gstatus, "Git Status")
register_keymap("n", "<leader>gp", vim.cmd.Gpush, "Git Push")
register_keymap("n", "<leader>gb", ":Gitsigns blame<CR>", "Git Blame")
register_keymap("n", "<leader>gw", vim.cmd.Gweb, "Git Web")
register_keymap("n", "<leader>gr", vim.cmd.Prc, "Git Pull Request")
