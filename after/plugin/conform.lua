local conform = require("conform")

vim.keymap.set("n", "<leader>fc", conform.format, { desc = "Format with Conform" })
