local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon Add" })
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu, { desc = "Harpoon Menu" })
--vim.keymap.set("n", "<C-]>", ui.nav_next, { desc = "Harpoon Next" })
--vim.keymap.set("n", "<C-[>", ui.nav_prev, { desc = "Harpoon Prev" })
