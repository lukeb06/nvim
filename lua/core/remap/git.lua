local vimtils = require("utils.vim")

vimtils.register_keymap("n", "<leader>gs", vim.cmd.Gstatus, "Git Status")
vimtils.register_keymap("n", "<leader>gp", vim.cmd.Gpush, "Git Push")
vimtils.register_keymap("n", "<leader>gb", ":Gitsigns blame<CR>", "Git Blame")
vimtils.register_keymap("n", "<leader>gw", vim.cmd.Gweb, "Git Web")
vimtils.register_keymap("n", "<leader>gr", vim.cmd.Prc, "Git Pull Request")
